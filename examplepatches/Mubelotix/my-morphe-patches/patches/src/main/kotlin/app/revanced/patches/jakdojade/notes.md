## Various strings

adsRequestManager
premiumManager
preferenceManager
BannerAdManager
AdSource
AdManagerAdView
adViewContainer
LoadPurchasesState

uf.g.l()

forcedTestPremium

PREMIUM_MONTHLY_V3
PREMIUM_YEARLY_V3

## IsPremium

The function isPremium wasn't used to disable ads as it caused app crashes (when opening the settings). They say premium has additional features so it might be worth another try.

```kt
internal val isPremiumFingerprint = fingerprint {
    accessFlags(AccessFlags.PUBLIC)
    parameters()
    returns("Z")
    opcodes(Opcode.IGET_OBJECT, Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.IGET_OBJECT, Opcode.INVOKE_INTERFACE, Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.IGET_OBJECT, Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT, Opcode.IF_NEZ, Opcode.CONST_4, Opcode.GOTO, Opcode.CONST_4, Opcode.RETURN)
}
```
