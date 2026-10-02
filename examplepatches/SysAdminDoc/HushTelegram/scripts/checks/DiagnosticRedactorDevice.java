import app.hushtelegram.extension.shared.diagnostics.DiagnosticRedactor;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

/** Runs the production redactor on either the JDK or Android's ART/ICU runtime. */
public final class DiagnosticRedactorDevice {
    private DiagnosticRedactorDevice() {
    }

    public static void main(String[] args) throws Exception {
        if (args.length != 2 || !("--export".equals(args[0]) || "--check".equals(args[0]))) {
            throw new IllegalArgumentException("Usage: DiagnosticRedactorDevice --export|--check <corpus.tsv>");
        }
        if ("--export".equals(args[0])) {
            // Reflection keeps the device payload independent of JUnit and the test class.
            Class<?> test = Class.forName("app.hushtelegram.extension.shared.diagnostics.DiagnosticRedactorTest");
            String[][] corpus = (String[][]) test.getField("CREDENTIAL_CORPUS").get(null);
            String probe = (String) test.getField("TELEGRAM_EXPORT_PROBE").get(null);
            String expected = (String) test.getField("TELEGRAM_EXPORT_REDACTED").get(null);
            if (corpus.length == 0) throw new AssertionError("The test corpus is empty");
            try (BufferedWriter out = new BufferedWriter(new OutputStreamWriter(
                    new FileOutputStream(args[1]), StandardCharsets.UTF_8))) {
                for (String[] row : corpus) {
                    if (row.length < 2) throw new AssertionError("A corpus row has no secrets");
                    writeRow(out, "C", row);
                }
                writeRow(out, "E", new String[]{probe, expected});
            }
            System.out.println("HUSHTELEGRAM_REDACTOR_EXPORT rows=" + corpus.length + " exact=1");
            return;
        }

        List<String[]> corpus = new ArrayList<>();
        List<String[]> exact = new ArrayList<>();
        try (BufferedReader in = new BufferedReader(new InputStreamReader(
                new FileInputStream(args[1]), StandardCharsets.UTF_8))) {
            for (String line; (line = in.readLine()) != null;) {
                String[] fields = line.split("\t", -1);
                if (fields.length < 3 || !("C".equals(fields[0]) || "E".equals(fields[0]))) {
                    throw new AssertionError("Invalid corpus record");
                }
                String[] row = new String[fields.length - 1];
                for (int i = 1; i < fields.length; i++) {
                    row[i - 1] = new String(Base64.getDecoder().decode(fields[i]), StandardCharsets.UTF_8);
                    if (row[i - 1].isEmpty()) throw new AssertionError("Empty corpus field");
                }
                if ("C".equals(fields[0])) {
                    corpus.add(row);
                } else {
                    if (row.length != 2) throw new AssertionError("An exact record needs input and expected text");
                    exact.add(row);
                }
            }
        }
        if (corpus.isEmpty() || exact.size() != 1) {
            throw new AssertionError("The corpus or Telegram expectation is missing");
        }

        StringBuilder joined = new StringBuilder("MORPHE DIAGNOSTIC REPORT\nschema: 1\n");
        for (int i = 0; i < corpus.size(); i++) {
            String[] row = corpus.get(i);
            requireNoSecrets(row, DiagnosticRedactor.redact(row[0]), "row " + i);
            joined.append(row[0]).append('\n');
        }
        String report = DiagnosticRedactor.redact(joined.toString());
        for (int i = 0; i < corpus.size(); i++) {
            requireNoSecrets(corpus.get(i), report, "joined row " + i);
        }
        for (String[] row : exact) {
            String actual = DiagnosticRedactor.redact(row[0]);
            if (!row[1].equals(actual)) {
                throw new AssertionError("Telegram probe lost redaction or its version/timestamp/counters: " + actual);
            }
            if (!report.contains(row[1] + "\n")) {
                throw new AssertionError("Joined report lost the redacted Telegram probe or its numeric controls");
            }
        }
        System.out.println("HUSHTELEGRAM_REDACTOR_OK rows=" + corpus.size() + " joined=1 exact=" + exact.size());
    }

    private static void writeRow(BufferedWriter out, String kind, String[] row) throws Exception {
        out.write(kind);
        for (String field : row) {
            if (field == null || field.isEmpty()) throw new AssertionError("Empty corpus field");
            out.write('\t');
            out.write(Base64.getEncoder().encodeToString(field.getBytes(StandardCharsets.UTF_8)));
        }
        out.write('\n');
    }

    private static void requireNoSecrets(String[] row, String text, String where) {
        for (int i = 1; i < row.length; i++) {
            if (text.contains(row[i])) {
                throw new AssertionError("Synthetic secret survived " + where + ": " + row[i]);
            }
        }
    }
}
