package app.tkiethuynh.patches.proxman



// Smali fragments that leave the desired value in v2 for a subsequent map put.
internal object V2 {
    const val TRUE = "sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;"
    const val FALSE = "sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;"
    const val NULL = "const/4 v2, 0x0"
    const val BOXED_ZERO = """
        const/4 v2, 0x0
        invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
        move-result-object v2
    """
    fun string(s: String) = "const-string v2, \"$s\""
}

internal fun linkedHashMapInit(reg: String) = """
    new-instance $reg, Ljava/util/LinkedHashMap;
    invoke-direct {$reg}, Ljava/util/LinkedHashMap;-><init>()V
"""

// put(key, <constant loaded into v2 by valueIntoV2>)
internal fun mapPutConst(map: String, key: String, valueIntoV2: String) = """
    const-string v1, "$key"
    $valueIntoV2
    invoke-virtual {$map, v1, v2}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
"""

// put(key, <object already in valueReg>)
internal fun mapPutRef(map: String, key: String, valueReg: String) = """
    const-string v1, "$key"
    invoke-virtual {$map, v1, $valueReg}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
"""
