package app.aidan.extension.adobescan;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

public final class PdfPageLayout {

    public static final class Word {
        public final String text;
        public final float left;
        public final float top;
        public final float right;
        public final float bottom;

        public Word(String text, float left, float top, float right, float bottom) {
            this.text = text != null ? text : "";
            this.left = left;
            this.top = top;
            this.right = right;
            this.bottom = bottom;
        }

        public float width() {
            return right - left;
        }

        public float height() {
            return bottom - top;
        }

        @Override
        public String toString() {
            return "Word{text='" + text + "', bounds=[" + left + ", " + top + ", " + right + ", " + bottom + "]}";
        }
    }

    public static final class Line {
        public final List<Word> words;
        public final float left;
        public final float top;
        public final float right;
        public final float bottom;

        public Line(List<Word> words) {
            this.words = Collections.unmodifiableList(new ArrayList<>(words));
            float l = 1.0f, t = 1.0f, r = 0.0f, b = 0.0f;
            for (Word w : words) {
                if (w.left < l) l = w.left;
                if (w.top < t) t = w.top;
                if (w.right > r) r = w.right;
                if (w.bottom > b) b = w.bottom;
            }
            this.left = l;
            this.top = t;
            this.right = r;
            this.bottom = b;
        }

        public String text() {
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < words.size(); i++) {
                if (i > 0) sb.append(' ');
                sb.append(words.get(i).text);
            }
            return sb.toString();
        }
    }

    public static final class Paragraph {
        public final List<Line> lines;

        public Paragraph(List<Line> lines) {
            this.lines = Collections.unmodifiableList(new ArrayList<>(lines));
        }

        public String text() {
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < lines.size(); i++) {
                if (i > 0) sb.append('\n');
                sb.append(lines.get(i).text());
            }
            return sb.toString();
        }
    }

    public static final class TableCell {
        public final String text;
        public final int row;
        public final int col;

        public TableCell(String text, int row, int col) {
            this.text = text != null ? text : "";
            this.row = row;
            this.col = col;
        }
    }

    public static final class Table {
        public final List<List<String>> rows;

        public Table(List<List<String>> rows) {
            this.rows = rows;
        }
    }

    public final int pageIndex;
    public final float pageWidth;
    public final float pageHeight;
    public final List<Word> words;
    public final List<Paragraph> paragraphs;
    public final List<Table> tables;

    public PdfPageLayout(int pageIndex, float pageWidth, float pageHeight, List<Word> words) {
        this.pageIndex = pageIndex;
        this.pageWidth = pageWidth;
        this.pageHeight = pageHeight;
        this.words = Collections.unmodifiableList(new ArrayList<>(words));
        final List<Paragraph> paras = new ArrayList<>();
        final List<Table> tbls = new ArrayList<>();
        reconstructStructure(this.words, paras, tbls);
        this.paragraphs = Collections.unmodifiableList(paras);
        this.tables = Collections.unmodifiableList(tbls);
    }

    private static void reconstructStructure(
            List<Word> words,
            List<Paragraph> outParagraphs,
            List<Table> outTables) {

        if (words.isEmpty()) return;
        List<Word> sorted = new ArrayList<>(words);
        sorted.sort(new Comparator<Word>() {
            @Override
            public int compare(Word a, Word b) {
                int cmp = Float.compare(a.top, b.top);
                if (cmp != 0) return cmp;
                return Float.compare(a.left, b.left);
            }
        });

        final Comparator<Word> leftComparator = new Comparator<Word>() {
            @Override
            public int compare(Word a, Word b) {
                return Float.compare(a.left, b.left);
            }
        };

        List<Line> lines = new ArrayList<>();
        List<Word> curLine = new ArrayList<>();
        float curLineY = -1;
        float curLineH = 0.02f;

        for (Word w : sorted) {
            if (curLine.isEmpty()) {
                curLine.add(w);
                curLineY = w.top;
                curLineH = Math.max(0.01f, w.height());
            } else {
                if (Math.abs(w.top - curLineY) <= curLineH * 0.8f) {
                    curLine.add(w);
                } else {
                    curLine.sort(leftComparator);
                    lines.add(new Line(curLine));
                    curLine = new ArrayList<>();
                    curLine.add(w);
                    curLineY = w.top;
                    curLineH = Math.max(0.01f, w.height());
                }
            }
        }
        if (!curLine.isEmpty()) {
            curLine.sort(leftComparator);
            lines.add(new Line(curLine));
        }
        final List<List<String>> currentTableRows = new ArrayList<>();
        final List<Float> currentTableCols = new ArrayList<>();
        final List<Line> currentTableLines = new ArrayList<>();
        final List<Line> nonTableLines = new ArrayList<>();

        final Runnable flushTable = new Runnable() {
            @Override
            public void run() {
                if (currentTableRows.size() >= 2) {
                    outTables.add(new Table(new ArrayList<>(currentTableRows)));
                } else if (currentTableRows.size() == 1) {
                    nonTableLines.addAll(currentTableLines);
                }
                currentTableRows.clear();
                currentTableCols.clear();
                currentTableLines.clear();
            }
        };
        for (Line line : lines) {
            List<String> cells = new ArrayList<>();
            List<Float> colPositions = new ArrayList<>();

            StringBuilder cellText = new StringBuilder();
            float cellStart = -1f;

            for (int wIdx = 0; wIdx < line.words.size(); wIdx++) {
                Word w = line.words.get(wIdx);
                if (cellText.length() == 0) {
                    cellText.append(w.text);
                    cellStart = w.left;
                } else {
                    Word prev = line.words.get(wIdx - 1);
                    float gap = w.left - prev.right;
                    if (gap >= 0.05f) {
                        cells.add(cellText.toString());
                        colPositions.add(cellStart);
                        cellText = new StringBuilder(w.text);
                        cellStart = w.left;
                    } else {
                        cellText.append(' ').append(w.text);
                    }
                }
            }
            if (cellText.length() > 0) {
                cells.add(cellText.toString());
                colPositions.add(cellStart);
            }

            boolean isTableCandidate = cells.size() >= 2;
            if (isTableCandidate) {
                if (currentTableRows.isEmpty()) {
                    currentTableRows.add(cells);
                    currentTableCols.clear();
                    currentTableCols.addAll(colPositions);
                    currentTableLines.add(line);
                } else {
                    boolean colsAlign = (cells.size() == currentTableCols.size());
                    if (colsAlign) {
                        for (int c = 0; c < cells.size(); c++) {
                            if (Math.abs(colPositions.get(c) - currentTableCols.get(c)) > 0.08f) {
                                colsAlign = false;
                                break;
                            }
                        }
                    }
                    if (colsAlign) {
                        currentTableRows.add(cells);
                        currentTableLines.add(line);
                    } else {
                        flushTable.run();
                        currentTableRows.add(cells);
                        currentTableCols.clear();
                        currentTableCols.addAll(colPositions);
                        currentTableLines.add(line);
                    }
                }
            } else {
                flushTable.run();
                nonTableLines.add(line);
            }
        }

        flushTable.run();

        List<Line> curPara = new ArrayList<>();
        for (int i = 0; i < nonTableLines.size(); i++) {
            Line line = nonTableLines.get(i);
            if (curPara.isEmpty()) {
                curPara.add(line);
            } else {
                Line prev = curPara.get(curPara.size() - 1);
                float lineSpacing = line.top - prev.bottom;
                float expectedSpacing = prev.bottom - prev.top;
                if (lineSpacing > expectedSpacing * 1.8f) {
                    outParagraphs.add(new Paragraph(curPara));
                    curPara = new ArrayList<>();
                }
                curPara.add(line);
            }
        }
        if (!curPara.isEmpty()) {
            outParagraphs.add(new Paragraph(curPara));
        }
    }
}
