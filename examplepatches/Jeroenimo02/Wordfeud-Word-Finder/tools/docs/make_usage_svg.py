#!/usr/bin/env python3
"""Generates docs/images/usage.svg, the "How to use" picture in the README (Python standard library only).

Usage: python3 tools/docs/make_usage_svg.py docs/images/usage.svg
"""
import sys
PTS = {"Q":10,"U":1,"I":1,"Z":10,"E":1,"N":1,"T":1,"R":1,"A":1,"O":1,"D":2}
N = 9
# premium squares (row, col): DL light blue, TL blue, DW pink, TW orange
PREM = {(0,0):"TW",(0,8):"TW",(8,0):"TW",(8,8):"TW",(1,1):"DW",(1,7):"DW",(7,1):"DW",(7,7):"DW",
        (2,4):"DL",(4,2):"DL",(6,4):"DL",(4,6):"TL",(0,4):"TL",(8,4):"TL",(4,0):"DL",(4,8):"DL"}
PCOL = {"DL":"#BFE3F2","TL":"#4E9BD1","DW":"#F3B6C2","TW":"#F0A35E"}
BOARD = {(3,2):"R",(3,3):"A",(3,4):"T",(3,5):"E",(4,2):"O",(5,2):"D"}
MOVE = {(0,5):"Q",(1,5):"U",(2,5):"I",(4,5):"T"}  # QUIET down through the E of RATE
RACK = list("QUIZENT")
out = []
A = out.append

def tile(x, y, s, ch, fill="#F6E3B4", stroke="#C9A85A", txt="#3B2F1A"):
    A(f'<rect x="{x}" y="{y}" width="{s}" height="{s}" rx="{s*0.14:.1f}" fill="{fill}" stroke="{stroke}" stroke-width="1"/>')
    A(f'<text x="{x+s*0.42:.1f}" y="{y+s*0.72:.1f}" text-anchor="middle" font-size="{s*0.56:.1f}" font-weight="700" fill="{txt}">{ch}</text>')
    A(f'<text x="{x+s*0.92:.1f}" y="{y+s*0.93:.1f}" text-anchor="end" font-size="{s*0.24:.1f}" fill="{txt}">{PTS[ch]}</text>')

def board(x0, y0, c, move=None, labels=True):
    A(f'<rect x="{x0-2}" y="{y0-2}" width="{N*c+4}" height="{N*c+4}" rx="3" fill="#2F3640"/>')
    for r in range(N):
        for k in range(N):
            x, y = x0 + k*c, y0 + r*c
            p = PREM.get((r,k))
            A(f'<rect x="{x+0.5}" y="{y+0.5}" width="{c-1}" height="{c-1}" rx="1.5" fill="{PCOL[p] if p else "#E9ECEF"}"/>')
            if p and labels and (r,k) not in BOARD and not (move and (r,k) in move):
                A(f'<text x="{x+c/2}" y="{y+c*0.64:.1f}" text-anchor="middle" font-size="{c*0.38:.1f}" font-weight="600" fill="#FFFFFF">{p}</text>')
    for (r,k),ch in BOARD.items():
        tile(x0+k*c+0.5, y0+r*c+0.5, c-1, ch)
    if move:
        for (r,k),ch in move.items():
            tile(x0+k*c+0.5, y0+r*c+0.5, c-1, ch, fill="#CFE3FF", stroke="#2F6FDB", txt="#12305E")

W, H = 640, 440
A(f'<svg xmlns="http://www.w3.org/2000/svg" width="{W}" height="{H}" viewBox="0 0 {W} {H}" font-family="-apple-system, Segoe UI, Roboto, Helvetica, Arial, sans-serif">')
A('<title>How to use the word finder: tap the book button above your rack, then pick a move and press Play next to it</title>')
A(f'<rect width="{W}" height="{H}" rx="14" fill="#F4F6F8"/>')

# ---------- step 1: game screen ----------
px, py, pw, ph = 40, 48, 230, 372
A(f'<text x="{px+pw/2}" y="30" text-anchor="middle" font-size="16" font-weight="600" fill="#1F2937">1. Open a game, tap the book</text>')
A(f'<rect x="{px}" y="{py}" width="{pw}" height="{ph}" rx="20" fill="#D0D5DB" stroke="#9CA3AF" stroke-width="2"/>')
# score bar
A(f'<rect x="{px+12}" y="{py+12}" width="{pw-24}" height="30" rx="8" fill="#FFFFFF"/>')
A(f'<text x="{px+22}" y="{py+32}" font-size="12" fill="#111827"><tspan font-weight="700">You</tspan> 203</text>')
A(f'<text x="{px+pw-22}" y="{py+32}" text-anchor="end" font-size="12" fill="#111827">186 <tspan font-weight="700">Anna</tspan></text>')
c = 22
bx = px + (pw - N*c)/2
board(bx, py+54, c)
# book button above the rack
fx, fy = px+pw-34, py+ph-74
A(f'<circle cx="{fx}" cy="{fy}" r="21" fill="none" stroke="#2563EB" stroke-width="2.5" stroke-dasharray="4 3"/>')
A(f'<circle cx="{fx}" cy="{fy}" r="15" fill="#1B5E9E"/>')
A(f'<path d="M{fx-8} {fy-5}c3-1.5 6-1.5 8 .5v10c-2-2-5-2-8-.5zM{fx+8} {fy-5}c-3-1.5-6-1.5-8 .5v10c2-2 5-2 8-.5z" fill="#FFFFFF"/>')
A(f'<text x="{fx-28}" y="{fy+5}" text-anchor="end" font-size="13" font-weight="700" fill="#2563EB">tap</text>')
# rack
rs = 27; rx0 = px + (pw - 7*rs - 6*3)/2; ry = py+ph-44
for i,ch in enumerate(RACK):
    tile(rx0 + i*(rs+3), ry, rs, ch)

# arrow
A('<path d="M286 224h40" stroke="#6B7280" stroke-width="2.5" fill="none"/><path d="M326 217l11 7-11 7z" fill="#6B7280"/>')

# ---------- step 2: overlay (same order as OverlayController.buildPanel) ----------
# header "Word finder" + close, rack (used tiles dimmed), board, info row (word, detail, score, Play),
# sort row (three equal buttons), move list (word, detail, score).
ox, oy, ow, oh = 352, 48, 248, ph
A(f'<text x="{ox+ow/2}" y="30" text-anchor="middle" font-size="16" font-weight="600" fill="#1F2937">2. Pick a move, press Play</text>')
A(f'<rect x="{ox}" y="{oy}" width="{ow}" height="{oh}" rx="20" fill="#FFFFFF" stroke="#9CA3AF" stroke-width="2"/>')
# header
A(f'<text x="{ox+16}" y="{oy+26}" font-size="14" font-weight="700" fill="#111827">Word finder</text>')
A(f'<text x="{ox+ow-18}" y="{oy+27}" text-anchor="end" font-size="18" fill="#374151">\u00d7</text>')
# rack, the tiles the chosen move uses dimmed
ms = 17; mx0 = ox + (ow - 7*ms - 6*2)/2
used = list(MOVE.values())
for i,ch in enumerate(RACK):
    if ch in used:
        used.remove(ch)
        tile(mx0 + i*(ms+2), oy+38, ms, ch, fill="#ECEEF1", stroke="#C7CBD1", txt="#9AA1AB")
    else:
        tile(mx0 + i*(ms+2), oy+38, ms, ch)
# preview board with the chosen move
c2 = 13
by0 = oy + 64
board(ox + (ow - N*c2)/2, by0, c2, move=MOVE, labels=False)
# info row: chosen word + detail, score, Play
iy = by0 + N*c2 + 12
A(f'<text x="{ox+16}" y="{iy+15}" font-size="15" font-weight="700" font-family="Menlo, Consolas, monospace" fill="#111827">QUIET</text>')
A(f'<text x="{ox+16}" y="{iy+30}" font-size="10" fill="#6B7280">Down \u00b7 Uses: Q U I T</text>')
A(f'<text x="{ox+ow-82}" y="{iy+21}" text-anchor="end" font-size="13" font-weight="700" fill="#111827">31 pts</text>')
A(f'<rect x="{ox+ow-74}" y="{iy+4}" width="58" height="26" rx="13" fill="#16A34A"/>')
A(f'<rect x="{ox+ow-79}" y="{iy-1}" width="68" height="36" rx="18" fill="none" stroke="#2563EB" stroke-width="2" stroke-dasharray="4 3"/>')
A(f'<text x="{ox+ow-45}" y="{iy+21.5}" text-anchor="middle" font-size="13" font-weight="700" fill="#FFFFFF">Play</text>')
# sort row: three equal buttons
sy = iy + 42
bw = (ow - 32 - 8) / 3
for i,(label,on) in enumerate([("Score", True), ("Length", False), ("A-Z", False)]):
    x = ox + 16 + i*(bw+4)
    A(f'<rect x="{x:.1f}" y="{sy}" width="{bw:.1f}" height="22" rx="11" fill="{"#1B5E9E" if on else "#E5E7EB"}"/>')
    A(f'<text x="{x+bw/2:.1f}" y="{sy+15}" text-anchor="middle" font-size="11" fill="{"#FFFFFF" if on else "#374151"}">{label}</text>')
# move list
moves = [("QUIET", "Down \u00b7 Uses: Q U I T", 31), ("QUINT", "Across \u00b7 Uses: Q U I N T", 28),
         ("ZINE", "Down \u00b7 Uses: Z I N", 24)]
ly = sy + 30; rh = 31
for i,(w,d,sc) in enumerate(moves):
    y = ly + i*rh
    if y + rh > oy + oh - 10: break
    if i == 0:
        A(f'<rect x="{ox+10}" y="{y}" width="{ow-20}" height="{rh-3}" rx="6" fill="#DBEAFE" stroke="#3B82F6"/>')
    else:
        A(f'<path d="M{ox+12} {y-1}h{ow-24}" stroke="#E5E7EB"/>')
    A(f'<text x="{ox+20}" y="{y+13}" font-size="12" font-weight="700" font-family="Menlo, Consolas, monospace" fill="#111827">{w}</text>')
    A(f'<text x="{ox+20}" y="{y+24}" font-size="9" fill="#6B7280">{d}</text>')
    A(f'<text x="{ox+ow-20}" y="{y+18}" text-anchor="end" font-size="12" font-weight="600" fill="#111827">{sc} pts</text>')
A('</svg>')
open(sys.argv[1], "w").write("\n".join(out) + "\n")
