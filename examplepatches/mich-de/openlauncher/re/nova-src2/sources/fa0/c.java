package fa0;

import androidx.recyclerview.widget.n0;
import com.vungle.ads.internal.protos.Sdk;
import fa.a0;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import v70.o;
import xk.c1;
import xk.h0;
import xk.i0;
import xk.n2;

/* loaded from: classes.dex */
public enum c {
    /* JADX INFO: Fake field, exist only in values array */
    EF11(2, 0, "NOP", "nop"),
    /* JADX INFO: Fake field, exist only in values array */
    EF25(5, 0, "MOVE", "move"),
    /* JADX INFO: Fake field, exist only in values array */
    EF41(18, 0, "MOVE_FROM16", "move/from16"),
    /* JADX INFO: Fake field, exist only in values array */
    EF57(24, 0, "MOVE_16", "move/16"),
    /* JADX INFO: Fake field, exist only in values array */
    EF69(5, 0, "MOVE_WIDE", "move-wide"),
    /* JADX INFO: Fake field, exist only in values array */
    EF85(18, 0, "MOVE_WIDE_FROM16", "move-wide/from16"),
    /* JADX INFO: Fake field, exist only in values array */
    EF102(24, 0, "MOVE_WIDE_16", "move-wide/16"),
    /* JADX INFO: Fake field, exist only in values array */
    EF116(5, 0, "MOVE_OBJECT", "move-object"),
    /* JADX INFO: Fake field, exist only in values array */
    EF133(18, 0, "MOVE_OBJECT_FROM16", "move-object/from16"),
    /* JADX INFO: Fake field, exist only in values array */
    EF148(24, 0, "MOVE_OBJECT_16", "move-object/16"),
    /* JADX INFO: Fake field, exist only in values array */
    EF167(4, 0, "MOVE_RESULT", "move-result"),
    /* JADX INFO: Fake field, exist only in values array */
    EF182(4, 0, "MOVE_RESULT_WIDE", "move-result-wide"),
    /* JADX INFO: Fake field, exist only in values array */
    EF197(4, 0, "MOVE_RESULT_OBJECT", "move-result-object"),
    /* JADX INFO: Fake field, exist only in values array */
    EF212(4, 0, "MOVE_EXCEPTION", "move-exception"),
    /* JADX INFO: Fake field, exist only in values array */
    RETURN_VOID(14, 2, "return-void"),
    /* JADX INFO: Fake field, exist only in values array */
    RETURN(15, 4, "return"),
    /* JADX INFO: Fake field, exist only in values array */
    RETURN_WIDE(16, 4, "return-wide"),
    /* JADX INFO: Fake field, exist only in values array */
    RETURN_OBJECT(17, 4, "return-object"),
    /* JADX INFO: Fake field, exist only in values array */
    EF293(3, 0, "CONST_4", "const/4"),
    /* JADX INFO: Fake field, exist only in values array */
    EF312(11, 0, "CONST_16", "const/16"),
    /* JADX INFO: Fake field, exist only in values array */
    EF329(22, 0, "CONST", "const"),
    /* JADX INFO: Fake field, exist only in values array */
    EF346(9, 0, "CONST_HIGH16", "const/high16"),
    /* JADX INFO: Fake field, exist only in values array */
    EF363(11, 0, "CONST_WIDE_16", "const-wide/16"),
    /* JADX INFO: Fake field, exist only in values array */
    EF378(22, 0, "CONST_WIDE_32", "const-wide/32"),
    /* JADX INFO: Fake field, exist only in values array */
    EF395(33, 0, "CONST_WIDE", "const-wide"),
    /* JADX INFO: Fake field, exist only in values array */
    EF412(10, 0, "CONST_WIDE_HIGH16", "const-wide/high16"),
    /* JADX INFO: Fake field, exist only in values array */
    EF431(8, 0, "CONST_STRING", "const-string"),
    /* JADX INFO: Fake field, exist only in values array */
    EF448(21, 0, "CONST_STRING_JUMBO", "const-string/jumbo"),
    /* JADX INFO: Fake field, exist only in values array */
    EF463(8, 0, "CONST_CLASS", "const-class"),
    /* JADX INFO: Fake field, exist only in values array */
    EF478(4, 0, "MONITOR_ENTER", "monitor-enter"),
    /* JADX INFO: Fake field, exist only in values array */
    EF493(4, 0, "MONITOR_EXIT", "monitor-exit"),
    /* JADX INFO: Fake field, exist only in values array */
    EF508(8, 0, "CHECK_CAST", "check-cast"),
    /* JADX INFO: Fake field, exist only in values array */
    EF529(14, 0, "INSTANCE_OF", "instance-of"),
    /* JADX INFO: Fake field, exist only in values array */
    EF545(5, 0, "ARRAY_LENGTH", "array-length"),
    /* JADX INFO: Fake field, exist only in values array */
    EF562(8, 0, "NEW_INSTANCE", "new-instance"),
    /* JADX INFO: Fake field, exist only in values array */
    EF579(14, 0, "NEW_ARRAY", "new-array"),
    /* JADX INFO: Fake field, exist only in values array */
    EF598(25, 0, "FILLED_NEW_ARRAY", "filled-new-array"),
    /* JADX INFO: Fake field, exist only in values array */
    EF617(28, 0, "FILLED_NEW_ARRAY_RANGE", "filled-new-array/range"),
    /* JADX INFO: Fake field, exist only in values array */
    EF636(23, 0, "FILL_ARRAY_DATA", "fill-array-data"),
    /* JADX INFO: Fake field, exist only in values array */
    EF651(4, 0, "THROW", "throw"),
    /* JADX INFO: Fake field, exist only in values array */
    GOTO(40, 1, "goto"),
    /* JADX INFO: Fake field, exist only in values array */
    GOTO_16(41, 7, "goto/16"),
    /* JADX INFO: Fake field, exist only in values array */
    GOTO_32(42, 20, "goto/32"),
    /* JADX INFO: Fake field, exist only in values array */
    EF715(23, 0, "PACKED_SWITCH", "packed-switch"),
    /* JADX INFO: Fake field, exist only in values array */
    EF730(23, 0, "SPARSE_SWITCH", "sparse-switch"),
    /* JADX INFO: Fake field, exist only in values array */
    EF749(19, 0, "CMPL_FLOAT", "cmpl-float"),
    /* JADX INFO: Fake field, exist only in values array */
    EF766(19, 0, "CMPG_FLOAT", "cmpg-float"),
    /* JADX INFO: Fake field, exist only in values array */
    EF781(19, 0, "CMPL_DOUBLE", "cmpl-double"),
    /* JADX INFO: Fake field, exist only in values array */
    EF796(19, 0, "CMPG_DOUBLE", "cmpg-double"),
    /* JADX INFO: Fake field, exist only in values array */
    EF811(19, 0, "CMP_LONG", "cmp-long"),
    /* JADX INFO: Fake field, exist only in values array */
    EF832(17, 0, "IF_EQ", "if-eq"),
    /* JADX INFO: Fake field, exist only in values array */
    EF847(17, 0, "IF_NE", "if-ne"),
    /* JADX INFO: Fake field, exist only in values array */
    EF862(17, 0, "IF_LT", "if-lt"),
    /* JADX INFO: Fake field, exist only in values array */
    EF877(17, 0, "IF_GE", "if-ge"),
    /* JADX INFO: Fake field, exist only in values array */
    EF892(17, 0, "IF_GT", "if-gt"),
    /* JADX INFO: Fake field, exist only in values array */
    EF907(17, 0, "IF_LE", "if-le"),
    /* JADX INFO: Fake field, exist only in values array */
    EF926(12, 0, "IF_EQZ", "if-eqz"),
    /* JADX INFO: Fake field, exist only in values array */
    EF941(12, 0, "IF_NEZ", "if-nez"),
    /* JADX INFO: Fake field, exist only in values array */
    EF956(12, 0, "IF_LTZ", "if-ltz"),
    /* JADX INFO: Fake field, exist only in values array */
    EF971(12, 0, "IF_GEZ", "if-gez"),
    /* JADX INFO: Fake field, exist only in values array */
    EF986(12, 0, "IF_GTZ", "if-gtz"),
    /* JADX INFO: Fake field, exist only in values array */
    EF1001(12, 0, "IF_LEZ", "if-lez"),
    /* JADX INFO: Fake field, exist only in values array */
    EF1014(19, 0, "AGET", "aget"),
    /* JADX INFO: Fake field, exist only in values array */
    EF1029(19, 0, "AGET_WIDE", "aget-wide"),
    /* JADX INFO: Fake field, exist only in values array */
    EF1044(19, 0, "AGET_OBJECT", "aget-object"),
    /* JADX INFO: Fake field, exist only in values array */
    EF1059(19, 0, "AGET_BOOLEAN", "aget-boolean"),
    /* JADX INFO: Fake field, exist only in values array */
    EF1074(19, 0, "AGET_BYTE", "aget-byte"),
    /* JADX INFO: Fake field, exist only in values array */
    EF1089(19, 0, "AGET_CHAR", "aget-char"),
    /* JADX INFO: Fake field, exist only in values array */
    EF1104(19, 0, "AGET_SHORT", "aget-short"),
    /* JADX INFO: Fake field, exist only in values array */
    EF1119(19, 0, "APUT", "aput"),
    /* JADX INFO: Fake field, exist only in values array */
    EF1134(19, 0, "APUT_WIDE", "aput-wide"),
    /* JADX INFO: Fake field, exist only in values array */
    EF1149(19, 0, "APUT_OBJECT", "aput-object"),
    /* JADX INFO: Fake field, exist only in values array */
    EF1164(19, 0, "APUT_BOOLEAN", "aput-boolean"),
    /* JADX INFO: Fake field, exist only in values array */
    EF1179(19, 0, "APUT_BYTE", "aput-byte"),
    /* JADX INFO: Fake field, exist only in values array */
    EF1194(19, 0, "APUT_CHAR", "aput-char"),
    /* JADX INFO: Fake field, exist only in values array */
    EF1209(19, 0, "APUT_SHORT", "aput-short"),
    /* JADX INFO: Fake field, exist only in values array */
    EF1224(14, 0, "IGET", "iget"),
    /* JADX INFO: Fake field, exist only in values array */
    EF1239(14, 0, "IGET_WIDE", "iget-wide"),
    /* JADX INFO: Fake field, exist only in values array */
    EF1254(14, 0, "IGET_OBJECT", "iget-object"),
    /* JADX INFO: Fake field, exist only in values array */
    EF1269(14, 0, "IGET_BOOLEAN", "iget-boolean"),
    /* JADX INFO: Fake field, exist only in values array */
    EF1284(14, 0, "IGET_BYTE", "iget-byte"),
    /* JADX INFO: Fake field, exist only in values array */
    EF1299(14, 0, "IGET_CHAR", "iget-char"),
    /* JADX INFO: Fake field, exist only in values array */
    EF1314(14, 0, "IGET_SHORT", "iget-short"),
    /* JADX INFO: Fake field, exist only in values array */
    EF1329(14, 0, "IPUT", "iput"),
    /* JADX INFO: Fake field, exist only in values array */
    EF1344(14, 0, "IPUT_WIDE", "iput-wide"),
    /* JADX INFO: Fake field, exist only in values array */
    EF1359(14, 0, "IPUT_OBJECT", "iput-object"),
    /* JADX INFO: Fake field, exist only in values array */
    EF1374(14, 0, "IPUT_BOOLEAN", "iput-boolean"),
    /* JADX INFO: Fake field, exist only in values array */
    EF1389(14, 0, "IPUT_BYTE", "iput-byte"),
    /* JADX INFO: Fake field, exist only in values array */
    EF1404(14, 0, "IPUT_CHAR", "iput-char"),
    /* JADX INFO: Fake field, exist only in values array */
    EF1419(14, 0, "IPUT_SHORT", "iput-short"),
    /* JADX INFO: Fake field, exist only in values array */
    EF1434(8, 0, "SGET", "sget"),
    /* JADX INFO: Fake field, exist only in values array */
    EF1449(8, 0, "SGET_WIDE", "sget-wide"),
    /* JADX INFO: Fake field, exist only in values array */
    EF1464(8, 0, "SGET_OBJECT", "sget-object"),
    /* JADX INFO: Fake field, exist only in values array */
    EF1479(8, 0, "SGET_BOOLEAN", "sget-boolean"),
    /* JADX INFO: Fake field, exist only in values array */
    EF1494(8, 0, "SGET_BYTE", "sget-byte"),
    /* JADX INFO: Fake field, exist only in values array */
    EF1509(8, 0, "SGET_CHAR", "sget-char"),
    /* JADX INFO: Fake field, exist only in values array */
    EF1524(8, 0, "SGET_SHORT", "sget-short"),
    /* JADX INFO: Fake field, exist only in values array */
    EF1539(8, 0, "SPUT", "sput"),
    /* JADX INFO: Fake field, exist only in values array */
    EF1554(8, 0, "SPUT_WIDE", "sput-wide"),
    /* JADX INFO: Fake field, exist only in values array */
    EF1569(8, 0, "SPUT_OBJECT", "sput-object"),
    /* JADX INFO: Fake field, exist only in values array */
    EF1584(8, 0, "SPUT_BOOLEAN", "sput-boolean"),
    /* JADX INFO: Fake field, exist only in values array */
    EF1599(8, 0, "SPUT_BYTE", "sput-byte"),
    /* JADX INFO: Fake field, exist only in values array */
    EF1614(8, 0, "SPUT_CHAR", "sput-char"),
    /* JADX INFO: Fake field, exist only in values array */
    EF1629(8, 0, "SPUT_SHORT", "sput-short"),
    /* JADX INFO: Fake field, exist only in values array */
    EF1646(25, 0, "INVOKE_VIRTUAL", "invoke-virtual"),
    /* JADX INFO: Fake field, exist only in values array */
    EF1661(25, 0, "INVOKE_SUPER", "invoke-super"),
    /* JADX INFO: Fake field, exist only in values array */
    EF1676(25, 0, "INVOKE_DIRECT", "invoke-direct"),
    /* JADX INFO: Fake field, exist only in values array */
    EF1691(25, 0, "INVOKE_STATIC", "invoke-static"),
    /* JADX INFO: Fake field, exist only in values array */
    EF1706(25, 0, "INVOKE_INTERFACE", "invoke-interface"),
    /* JADX INFO: Fake field, exist only in values array */
    EF1721(28, 0, "INVOKE_VIRTUAL_RANGE", "invoke-virtual/range"),
    /* JADX INFO: Fake field, exist only in values array */
    EF1736(28, 0, "INVOKE_SUPER_RANGE", "invoke-super/range"),
    /* JADX INFO: Fake field, exist only in values array */
    EF1751(28, 0, "INVOKE_DIRECT_RANGE", "invoke-direct/range"),
    /* JADX INFO: Fake field, exist only in values array */
    EF1766(28, 0, "INVOKE_STATIC_RANGE", "invoke-static/range"),
    /* JADX INFO: Fake field, exist only in values array */
    EF1781(28, 0, "INVOKE_INTERFACE_RANGE", "invoke-interface/range"),
    /* JADX INFO: Fake field, exist only in values array */
    EF1794(5, 0, "NEG_INT", "neg-int"),
    /* JADX INFO: Fake field, exist only in values array */
    EF1809(5, 0, "NOT_INT", "not-int"),
    /* JADX INFO: Fake field, exist only in values array */
    EF1824(5, 0, "NEG_LONG", "neg-long"),
    /* JADX INFO: Fake field, exist only in values array */
    EF1839(5, 0, "NOT_LONG", "not-long"),
    /* JADX INFO: Fake field, exist only in values array */
    EF1854(5, 0, "NEG_FLOAT", "neg-float"),
    /* JADX INFO: Fake field, exist only in values array */
    EF1869(5, 0, "NEG_DOUBLE", "neg-double"),
    /* JADX INFO: Fake field, exist only in values array */
    EF1884(5, 0, "INT_TO_LONG", "int-to-long"),
    /* JADX INFO: Fake field, exist only in values array */
    EF1899(5, 0, "INT_TO_FLOAT", "int-to-float"),
    /* JADX INFO: Fake field, exist only in values array */
    EF1914(5, 0, "INT_TO_DOUBLE", "int-to-double"),
    /* JADX INFO: Fake field, exist only in values array */
    EF1929(5, 0, "LONG_TO_INT", "long-to-int"),
    /* JADX INFO: Fake field, exist only in values array */
    EF1944(5, 0, "LONG_TO_FLOAT", "long-to-float"),
    /* JADX INFO: Fake field, exist only in values array */
    EF1959(5, 0, "LONG_TO_DOUBLE", "long-to-double"),
    /* JADX INFO: Fake field, exist only in values array */
    EF1974(5, 0, "FLOAT_TO_INT", "float-to-int"),
    /* JADX INFO: Fake field, exist only in values array */
    EF1989(5, 0, "FLOAT_TO_LONG", "float-to-long"),
    /* JADX INFO: Fake field, exist only in values array */
    EF2004(5, 0, "FLOAT_TO_DOUBLE", "float-to-double"),
    /* JADX INFO: Fake field, exist only in values array */
    EF2019(5, 0, "DOUBLE_TO_INT", "double-to-int"),
    /* JADX INFO: Fake field, exist only in values array */
    EF2034(5, 0, "DOUBLE_TO_LONG", "double-to-long"),
    /* JADX INFO: Fake field, exist only in values array */
    EF2049(5, 0, "DOUBLE_TO_FLOAT", "double-to-float"),
    /* JADX INFO: Fake field, exist only in values array */
    EF2064(5, 0, "INT_TO_BYTE", "int-to-byte"),
    /* JADX INFO: Fake field, exist only in values array */
    EF2079(5, 0, "INT_TO_CHAR", "int-to-char"),
    /* JADX INFO: Fake field, exist only in values array */
    EF2094(5, 0, "INT_TO_SHORT", "int-to-short"),
    /* JADX INFO: Fake field, exist only in values array */
    EF2109(19, 0, "ADD_INT", "add-int"),
    /* JADX INFO: Fake field, exist only in values array */
    EF2124(19, 0, "SUB_INT", "sub-int"),
    /* JADX INFO: Fake field, exist only in values array */
    EF2139(19, 0, "MUL_INT", "mul-int"),
    /* JADX INFO: Fake field, exist only in values array */
    EF2154(19, 0, "DIV_INT", "div-int"),
    /* JADX INFO: Fake field, exist only in values array */
    EF2169(19, 0, "REM_INT", "rem-int"),
    /* JADX INFO: Fake field, exist only in values array */
    EF2184(19, 0, "AND_INT", "and-int"),
    /* JADX INFO: Fake field, exist only in values array */
    EF2199(19, 0, "OR_INT", "or-int"),
    /* JADX INFO: Fake field, exist only in values array */
    EF2214(19, 0, "XOR_INT", "xor-int"),
    /* JADX INFO: Fake field, exist only in values array */
    EF2229(19, 0, "SHL_INT", "shl-int"),
    /* JADX INFO: Fake field, exist only in values array */
    EF2244(19, 0, "SHR_INT", "shr-int"),
    /* JADX INFO: Fake field, exist only in values array */
    EF2259(19, 0, "USHR_INT", "ushr-int"),
    /* JADX INFO: Fake field, exist only in values array */
    EF2274(19, 0, "ADD_LONG", "add-long"),
    /* JADX INFO: Fake field, exist only in values array */
    EF2289(19, 0, "SUB_LONG", "sub-long"),
    /* JADX INFO: Fake field, exist only in values array */
    EF2304(19, 0, "MUL_LONG", "mul-long"),
    /* JADX INFO: Fake field, exist only in values array */
    EF2319(19, 0, "DIV_LONG", "div-long"),
    /* JADX INFO: Fake field, exist only in values array */
    EF2334(19, 0, "REM_LONG", "rem-long"),
    /* JADX INFO: Fake field, exist only in values array */
    EF2349(19, 0, "AND_LONG", "and-long"),
    /* JADX INFO: Fake field, exist only in values array */
    EF2364(19, 0, "OR_LONG", "or-long"),
    /* JADX INFO: Fake field, exist only in values array */
    EF2379(19, 0, "XOR_LONG", "xor-long"),
    /* JADX INFO: Fake field, exist only in values array */
    EF2394(19, 0, "SHL_LONG", "shl-long"),
    /* JADX INFO: Fake field, exist only in values array */
    EF2409(19, 0, "SHR_LONG", "shr-long"),
    /* JADX INFO: Fake field, exist only in values array */
    EF2424(19, 0, "USHR_LONG", "ushr-long"),
    /* JADX INFO: Fake field, exist only in values array */
    EF2439(19, 0, "ADD_FLOAT", "add-float"),
    /* JADX INFO: Fake field, exist only in values array */
    EF2454(19, 0, "SUB_FLOAT", "sub-float"),
    /* JADX INFO: Fake field, exist only in values array */
    EF2469(19, 0, "MUL_FLOAT", "mul-float"),
    /* JADX INFO: Fake field, exist only in values array */
    EF2484(19, 0, "DIV_FLOAT", "div-float"),
    /* JADX INFO: Fake field, exist only in values array */
    EF2499(19, 0, "REM_FLOAT", "rem-float"),
    /* JADX INFO: Fake field, exist only in values array */
    EF2514(19, 0, "ADD_DOUBLE", "add-double"),
    /* JADX INFO: Fake field, exist only in values array */
    EF2529(19, 0, "SUB_DOUBLE", "sub-double"),
    /* JADX INFO: Fake field, exist only in values array */
    EF2544(19, 0, "MUL_DOUBLE", "mul-double"),
    /* JADX INFO: Fake field, exist only in values array */
    EF2559(19, 0, "DIV_DOUBLE", "div-double"),
    /* JADX INFO: Fake field, exist only in values array */
    EF2574(19, 0, "REM_DOUBLE", "rem-double"),
    /* JADX INFO: Fake field, exist only in values array */
    EF2587(5, 0, "ADD_INT_2ADDR", "add-int/2addr"),
    /* JADX INFO: Fake field, exist only in values array */
    EF2602(5, 0, "SUB_INT_2ADDR", "sub-int/2addr"),
    /* JADX INFO: Fake field, exist only in values array */
    EF2617(5, 0, "MUL_INT_2ADDR", "mul-int/2addr"),
    /* JADX INFO: Fake field, exist only in values array */
    EF2632(5, 0, "DIV_INT_2ADDR", "div-int/2addr"),
    /* JADX INFO: Fake field, exist only in values array */
    EF2647(5, 0, "REM_INT_2ADDR", "rem-int/2addr"),
    /* JADX INFO: Fake field, exist only in values array */
    EF2662(5, 0, "AND_INT_2ADDR", "and-int/2addr"),
    /* JADX INFO: Fake field, exist only in values array */
    EF2677(5, 0, "OR_INT_2ADDR", "or-int/2addr"),
    /* JADX INFO: Fake field, exist only in values array */
    EF2692(5, 0, "XOR_INT_2ADDR", "xor-int/2addr"),
    /* JADX INFO: Fake field, exist only in values array */
    EF2707(5, 0, "SHL_INT_2ADDR", "shl-int/2addr"),
    /* JADX INFO: Fake field, exist only in values array */
    EF2722(5, 0, "SHR_INT_2ADDR", "shr-int/2addr"),
    /* JADX INFO: Fake field, exist only in values array */
    EF2737(5, 0, "USHR_INT_2ADDR", "ushr-int/2addr"),
    /* JADX INFO: Fake field, exist only in values array */
    EF2752(5, 0, "ADD_LONG_2ADDR", "add-long/2addr"),
    /* JADX INFO: Fake field, exist only in values array */
    EF2767(5, 0, "SUB_LONG_2ADDR", "sub-long/2addr"),
    /* JADX INFO: Fake field, exist only in values array */
    EF2782(5, 0, "MUL_LONG_2ADDR", "mul-long/2addr"),
    /* JADX INFO: Fake field, exist only in values array */
    EF2797(5, 0, "DIV_LONG_2ADDR", "div-long/2addr"),
    /* JADX INFO: Fake field, exist only in values array */
    EF2812(5, 0, "REM_LONG_2ADDR", "rem-long/2addr"),
    /* JADX INFO: Fake field, exist only in values array */
    EF2827(5, 0, "AND_LONG_2ADDR", "and-long/2addr"),
    /* JADX INFO: Fake field, exist only in values array */
    EF2842(5, 0, "OR_LONG_2ADDR", "or-long/2addr"),
    /* JADX INFO: Fake field, exist only in values array */
    EF2857(5, 0, "XOR_LONG_2ADDR", "xor-long/2addr"),
    /* JADX INFO: Fake field, exist only in values array */
    EF2872(5, 0, "SHL_LONG_2ADDR", "shl-long/2addr"),
    /* JADX INFO: Fake field, exist only in values array */
    EF2887(5, 0, "SHR_LONG_2ADDR", "shr-long/2addr"),
    /* JADX INFO: Fake field, exist only in values array */
    EF2902(5, 0, "USHR_LONG_2ADDR", "ushr-long/2addr"),
    /* JADX INFO: Fake field, exist only in values array */
    EF2917(5, 0, "ADD_FLOAT_2ADDR", "add-float/2addr"),
    /* JADX INFO: Fake field, exist only in values array */
    EF2932(5, 0, "SUB_FLOAT_2ADDR", "sub-float/2addr"),
    /* JADX INFO: Fake field, exist only in values array */
    EF2947(5, 0, "MUL_FLOAT_2ADDR", "mul-float/2addr"),
    /* JADX INFO: Fake field, exist only in values array */
    EF2962(5, 0, "DIV_FLOAT_2ADDR", "div-float/2addr"),
    /* JADX INFO: Fake field, exist only in values array */
    EF2977(5, 0, "REM_FLOAT_2ADDR", "rem-float/2addr"),
    /* JADX INFO: Fake field, exist only in values array */
    EF2992(5, 0, "ADD_DOUBLE_2ADDR", "add-double/2addr"),
    /* JADX INFO: Fake field, exist only in values array */
    EF3007(5, 0, "SUB_DOUBLE_2ADDR", "sub-double/2addr"),
    /* JADX INFO: Fake field, exist only in values array */
    EF3022(5, 0, "MUL_DOUBLE_2ADDR", "mul-double/2addr"),
    /* JADX INFO: Fake field, exist only in values array */
    EF3037(5, 0, "DIV_DOUBLE_2ADDR", "div-double/2addr"),
    /* JADX INFO: Fake field, exist only in values array */
    EF3052(5, 0, "REM_DOUBLE_2ADDR", "rem-double/2addr"),
    /* JADX INFO: Fake field, exist only in values array */
    EF3071(16, 0, "ADD_INT_LIT16", "add-int/lit16"),
    /* JADX INFO: Fake field, exist only in values array */
    EF3086(16, 0, "RSUB_INT", "rsub-int"),
    /* JADX INFO: Fake field, exist only in values array */
    EF3101(16, 0, "MUL_INT_LIT16", "mul-int/lit16"),
    /* JADX INFO: Fake field, exist only in values array */
    EF3116(16, 0, "DIV_INT_LIT16", "div-int/lit16"),
    /* JADX INFO: Fake field, exist only in values array */
    EF3131(16, 0, "REM_INT_LIT16", "rem-int/lit16"),
    /* JADX INFO: Fake field, exist only in values array */
    EF3146(16, 0, "AND_INT_LIT16", "and-int/lit16"),
    /* JADX INFO: Fake field, exist only in values array */
    EF3161(16, 0, "OR_INT_LIT16", "or-int/lit16"),
    /* JADX INFO: Fake field, exist only in values array */
    EF3176(16, 0, "XOR_INT_LIT16", "xor-int/lit16"),
    /* JADX INFO: Fake field, exist only in values array */
    EF3195(13, 0, "ADD_INT_LIT8", "add-int/lit8"),
    /* JADX INFO: Fake field, exist only in values array */
    EF3210(13, 0, "RSUB_INT_LIT8", "rsub-int/lit8"),
    /* JADX INFO: Fake field, exist only in values array */
    EF3225(13, 0, "MUL_INT_LIT8", "mul-int/lit8"),
    /* JADX INFO: Fake field, exist only in values array */
    EF3240(13, 0, "DIV_INT_LIT8", "div-int/lit8"),
    /* JADX INFO: Fake field, exist only in values array */
    EF3255(13, 0, "REM_INT_LIT8", "rem-int/lit8"),
    /* JADX INFO: Fake field, exist only in values array */
    EF3270(13, 0, "AND_INT_LIT8", "and-int/lit8"),
    /* JADX INFO: Fake field, exist only in values array */
    EF3285(13, 0, "OR_INT_LIT8", "or-int/lit8"),
    /* JADX INFO: Fake field, exist only in values array */
    EF3300(13, 0, "XOR_INT_LIT8", "xor-int/lit8"),
    /* JADX INFO: Fake field, exist only in values array */
    EF3315(13, 0, "SHL_INT_LIT8", "shl-int/lit8"),
    /* JADX INFO: Fake field, exist only in values array */
    EF3330(13, 0, "SHR_INT_LIT8", "shr-int/lit8"),
    /* JADX INFO: Fake field, exist only in values array */
    EF3345(13, 0, "USHR_INT_LIT8", "ushr-int/lit8"),
    /* JADX INFO: Fake field, exist only in values array */
    IGET_VOLATILE(g(Sdk.SDKError.Reason.INVALID_CSB_DATA_VALUE, 9), "iget-volatile", 14),
    /* JADX INFO: Fake field, exist only in values array */
    IPUT_VOLATILE(g(228, 9), "iput-volatile", 14),
    /* JADX INFO: Fake field, exist only in values array */
    SGET_VOLATILE(g(229, 9), "sget-volatile", 8),
    /* JADX INFO: Fake field, exist only in values array */
    SPUT_VOLATILE(g(230, 9), "sput-volatile", 8),
    /* JADX INFO: Fake field, exist only in values array */
    IGET_OBJECT_VOLATILE(g(231, 9), "iget-object-volatile", 14),
    /* JADX INFO: Fake field, exist only in values array */
    IGET_WIDE_VOLATILE(g(232, 9), "iget-wide-volatile", 14),
    /* JADX INFO: Fake field, exist only in values array */
    IPUT_WIDE_VOLATILE(g(233, 9), "iput-wide-volatile", 14),
    /* JADX INFO: Fake field, exist only in values array */
    SGET_WIDE_VOLATILE(g(234, 9), "sget-wide-volatile", 8),
    /* JADX INFO: Fake field, exist only in values array */
    SPUT_WIDE_VOLATILE(g(235, 9), "sput-wide-volatile", 8),
    /* JADX INFO: Fake field, exist only in values array */
    THROW_VERIFICATION_ERROR(g(237, 5), "throw-verification-error", 6),
    /* JADX INFO: Fake field, exist only in values array */
    EXECUTE_INLINE(a(238), "execute-inline", 26),
    /* JADX INFO: Fake field, exist only in values array */
    EXECUTE_INLINE_RANGE(g(239, 8), "execute-inline/range", 29),
    /* JADX INFO: Fake field, exist only in values array */
    INVOKE_DIRECT_EMPTY(i(240, 13), "invoke-direct-empty", 25),
    /* JADX INFO: Fake field, exist only in values array */
    INVOKE_OBJECT_INIT_RANGE(g(240, 14), "invoke-object-init/range", 28),
    /* JADX INFO: Fake field, exist only in values array */
    RETURN_VOID_BARRIER(d(g(241, 11), j()), "return-void-barrier", 2),
    /* JADX INFO: Fake field, exist only in values array */
    RETURN_VOID_NO_BARRIER(h(115, 60), "return-void-no-barrier", 2),
    /* JADX INFO: Fake field, exist only in values array */
    IGET_QUICK(d(a(242), b(Sdk.SDKError.Reason.INVALID_CSB_DATA_VALUE)), "iget-quick", 15),
    /* JADX INFO: Fake field, exist only in values array */
    IGET_WIDE_QUICK(d(a(243), b(228)), "iget-wide-quick", 15),
    /* JADX INFO: Fake field, exist only in values array */
    IGET_OBJECT_QUICK(d(a(244), b(229)), "iget-object-quick", 15),
    /* JADX INFO: Fake field, exist only in values array */
    IPUT_QUICK(d(a(245), b(230)), "iput-quick", 15),
    /* JADX INFO: Fake field, exist only in values array */
    IPUT_WIDE_QUICK(d(a(246), b(231)), "iput-wide-quick", 15),
    /* JADX INFO: Fake field, exist only in values array */
    IPUT_OBJECT_QUICK(d(a(247), b(232)), "iput-object-quick", 15),
    /* JADX INFO: Fake field, exist only in values array */
    IPUT_BOOLEAN_QUICK(b(235), "iput-boolean-quick", 15),
    /* JADX INFO: Fake field, exist only in values array */
    IPUT_BYTE_QUICK(b(236), "iput-byte-quick", 15),
    /* JADX INFO: Fake field, exist only in values array */
    IPUT_CHAR_QUICK(b(237), "iput-char-quick", 15),
    /* JADX INFO: Fake field, exist only in values array */
    IPUT_SHORT_QUICK(b(238), "iput-short-quick", 15),
    /* JADX INFO: Fake field, exist only in values array */
    IGET_BOOLEAN_QUICK(b(239), "iget-boolean-quick", 15),
    /* JADX INFO: Fake field, exist only in values array */
    IGET_BYTE_QUICK(b(240), "iget-byte-quick", 15),
    /* JADX INFO: Fake field, exist only in values array */
    IGET_CHAR_QUICK(b(241), "iget-char-quick", 15),
    /* JADX INFO: Fake field, exist only in values array */
    IGET_SHORT_QUICK(b(242), "iget-short-quick", 15),
    /* JADX INFO: Fake field, exist only in values array */
    INVOKE_VIRTUAL_QUICK(d(a(248), b(233)), "invoke-virtual-quick", 27),
    /* JADX INFO: Fake field, exist only in values array */
    INVOKE_VIRTUAL_QUICK_RANGE(d(a(249), b(234)), "invoke-virtual-quick/range", 30),
    /* JADX INFO: Fake field, exist only in values array */
    INVOKE_SUPER_QUICK(i(n0.DEFAULT_SWIPE_ANIMATION_DURATION, 25), "invoke-super-quick", 27),
    /* JADX INFO: Fake field, exist only in values array */
    INVOKE_SUPER_QUICK_RANGE(i(251, 25), "invoke-super-quick/range", 30),
    /* JADX INFO: Fake field, exist only in values array */
    IPUT_OBJECT_VOLATILE(g(252, 9), "iput-object-volatile", 14),
    /* JADX INFO: Fake field, exist only in values array */
    SGET_OBJECT_VOLATILE(g(253, 9), "sget-object-volatile", 8),
    /* JADX INFO: Fake field, exist only in values array */
    SPUT_OBJECT_VOLATILE(c(), "sput-object-volatile", 8),
    /* JADX INFO: Fake field, exist only in values array */
    EF4697(35, 0, "PACKED_SWITCH_PAYLOAD", "packed-switch-payload"),
    /* JADX INFO: Fake field, exist only in values array */
    EF4735(36, 0, "SPARSE_SWITCH_PAYLOAD", "sparse-switch-payload"),
    /* JADX INFO: Fake field, exist only in values array */
    EF4773(34, 0, "ARRAY_PAYLOAD", "array-payload"),
    /* JADX INFO: Fake field, exist only in values array */
    INVOKE_POLYMORPHIC(h(n0.DEFAULT_SWIPE_ANIMATION_DURATION, 87), "invoke-polymorphic", 31, 0),
    /* JADX INFO: Fake field, exist only in values array */
    INVOKE_POLYMORPHIC_RANGE(h(251, 87), "invoke-polymorphic/range", 32, 0),
    /* JADX INFO: Fake field, exist only in values array */
    INVOKE_CUSTOM(h(252, 111), "invoke-custom", 25),
    /* JADX INFO: Fake field, exist only in values array */
    INVOKE_CUSTOM_RANGE(h(253, 111), "invoke-custom/range", 28),
    /* JADX INFO: Fake field, exist only in values array */
    CONST_METHOD_HANDLE(h(254, Sdk.SDKError.Reason.STORE_REGION_CODE_ERROR_VALUE), "const-method-handle", 8),
    /* JADX INFO: Fake field, exist only in values array */
    CONST_METHOD_TYPE(h(255, Sdk.SDKError.Reason.STORE_REGION_CODE_ERROR_VALUE), "const-method-type", 8);


    /* renamed from: a, reason: collision with root package name */
    public final c1 f54572a;

    /* renamed from: b, reason: collision with root package name */
    public final c1 f54573b;

    /* renamed from: c, reason: collision with root package name */
    public final String f54574c;

    /* renamed from: d, reason: collision with root package name */
    public final int f54575d;

    c(int i5, int i11, String str) {
        this(i11, 0, str, str);
    }

    public static ArrayList a(int i5) {
        return o.i(new b(n2.f95978c, n2.a(), i5));
    }

    public static ArrayList b(int i5) {
        return o.i(new b(n2.a(), n2.f95978c, i5));
    }

    public static ArrayList c() {
        return o.i(new b(new n2(new h0(9, 2), new i0(19)), n2.a(), 254));
    }

    public static ArrayList d(List... listArr) {
        ArrayList arrayList = new ArrayList();
        for (List list : listArr) {
            arrayList.addAll(list);
        }
        return arrayList;
    }

    public static ArrayList g(int i5, int i11) {
        Integer numValueOf = Integer.valueOf(i11);
        n2 n2Var = n2.f95978c;
        return o.i(new b(new n2(new h0(numValueOf, 2), h0.f95922c), n2.a(), i5));
    }

    public static ArrayList h(int i5, int i11) {
        return o.i(new b(n2.a(), new n2(new h0(Integer.valueOf(i11), 2), h0.f95922c), i5));
    }

    public static ArrayList i(int i5, int i11) {
        Integer numValueOf = Integer.valueOf(i11);
        n2 n2Var = n2.f95978c;
        return o.i(new b(new n2(h0.f95923d, new i0(numValueOf)), n2.a(), i5));
    }

    public static ArrayList j() {
        return o.i(new b(n2.a(), new n2(h0.f95923d, new i0(59)), 115));
    }

    c(ArrayList arrayList, String str, int i5) {
        this(arrayList, str, i5, 0);
    }

    c(ArrayList arrayList, String str, int i5, int i11) {
        int i12 = c1.f95883c;
        a0 a0Var = new a0(1);
        a0 a0Var2 = new a0(1);
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            b bVar = (b) it.next();
            n2 n2Var = bVar.f54568a;
            n2 n2Var2 = bVar.f54569b;
            int i13 = bVar.f54570c;
            if (!n2Var.f95979a.equals(n2Var.f95980b)) {
                a0Var.b(bVar.f54568a, Short.valueOf((short) i13));
            }
            if (!n2Var2.f95979a.equals(n2Var2.f95980b)) {
                a0Var2.b(n2Var2, Short.valueOf((short) i13));
            }
        }
        this.f54572a = a0Var.a();
        this.f54573b = a0Var2.a();
        this.f54574c = str;
        this.f54575d = i5;
    }

    /* JADX WARN: Illegal instructions before constructor call */
    c(int i5, int i11, String str, String str2) {
        n2 n2Var = n2.f95978c;
        this(o.i(new b(n2Var, n2Var, i)), str2, i5, 0);
    }
}
