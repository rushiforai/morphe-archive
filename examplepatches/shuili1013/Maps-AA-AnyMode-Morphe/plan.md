# 待評估事項

## 在 Android Auto 畫面上顯示機車模式按鈕（非目前做法，暫緩）

**現況**：目前的 patch（`patch/core/src/main/java/tw/maps/TwoWheelerCore.java`）是在 `btxk.h()`／`qxa.b(...)` 這兩個選路線模式的方法裡做靜默攔截——只要投影車種被判定為 CAR，就直接把結果改成 TWO_WHEELER，使用者在車機介面上完全看不到、也不能選模式。只要連上 AA 且車機回報 CAR，就一律機車模式，沒有切回汽車模式的 UI 路徑。

**想要的效果**：改成在 AA 車機畫面上實際顯示一個可以點的「機車導航」按鈕/圖示，讓使用者每趟行程自己決定要汽車還是機車模式，而不是寫死永遠機車。

**為什麼現在沒做，以及要做的話需要什麼**：

這跟現有 patch 不是同一塊系統。現有 patch 動的是「後端路線模式判斷/建構」邏輯；車機畫面上顯示哪些按鈕，是另一套「AA UI 範本渲染」的程式碼，今天完全沒有碰過、沒有任何候選位置的證據。要做的話至少需要：

1. 找到 AA 車機介面的模式選擇 icon 列表是在哪段 bytecode 組出來的（新的逆向工程起點，不能沿用 `findings.md` 現有的候選位置表）。
2. 搞清楚現有限制從哪裡來——已知線索：`trq.h(Lckbl;)Z` 與 `trq.f()V`（`analysis/mode-guards/`、`analysis/projected-mode/`）裡有寫死的限制原因 `PROJECTED_ONLY_DRIVING_SUPPORTED`／`PROJECTED_ONLY_TWO_WHEELER_SUPPORTED`，代表 Google 原生邏輯就是「投影模式下只允許顯示一種模式」，這是刻意設計而非遺漏，要修改這塊才能讓兩個按鈕同時出現。
3. 把按鈕的點擊事件接回真正的模式選擇流程，讓按下去時走正規路徑設成 TWO_WHEELER，而不是像現在這樣直接攔截判斷結果。

**風險評估**：UI 組裝的 bytecode 通常比單純邏輯分支更脆弱（View 狀態、暫存器依賴更複雜），改壞了容易整個車機畫面跑版或 crash，不像現在這兩個方法的 patch 範圍小、容易驗證。

**決定**：先不做。MS700CL 是使用者自己機車專用的車機，不會拿去開車，「永遠機車模式」對目前的使用情境沒有實際問題。待目前這版 patch 用 headunit／真正裝到 MS700CL 上驗證過路線規劃正確無誤後，再考慮是否要投入這塊額外的逆向工程。

---

*其餘待辦與已知限制見 [findings.md](findings.md)（第二階段技術細節、下一步）與 `patch/README.md`（patch 範圍與限制）。MicroG-RE 相容性修正記錄在 fork [shuili1013/MicroG-RE](https://github.com/shuili1013/MicroG-RE)（KNOWN_GOOGLE_PACKAGES 新增 Maps、GoogleLocationManagerService 相容 action）。*
