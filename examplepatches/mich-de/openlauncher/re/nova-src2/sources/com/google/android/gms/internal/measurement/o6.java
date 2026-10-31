package com.google.android.gms.internal.measurement;

import java.util.HashMap;

/* loaded from: classes3.dex */
public enum o6 {
    ADD(0),
    AND(1),
    APPLY(2),
    ASSIGN(3),
    BITWISE_AND(56),
    BITWISE_LEFT_SHIFT(57),
    BITWISE_NOT(58),
    BITWISE_OR(59),
    BITWISE_RIGHT_SHIFT(60),
    BITWISE_UNSIGNED_RIGHT_SHIFT(61),
    BITWISE_XOR(62),
    BLOCK(53),
    BREAK(4),
    CASE(5),
    CONST(52),
    CONTINUE(6),
    /* JADX INFO: Fake field, exist only in values array */
    CONTROL(49),
    CREATE_ARRAY(7),
    CREATE_OBJECT(8),
    DEFAULT(9),
    DEFINE_FUNCTION(50),
    DIVIDE(10),
    /* JADX INFO: Fake field, exist only in values array */
    GET_CONTAINER_VARIABLE(11),
    EQUALS(12),
    EXPRESSION_LIST(13),
    FN(51),
    FOR_IN(47),
    FOR_IN_CONST(54),
    FOR_IN_LET(55),
    FOR_LET(63),
    FOR_OF(64),
    FOR_OF_CONST(65),
    FOR_OF_LET(66),
    GET(15),
    /* JADX INFO: Fake field, exist only in values array */
    GET_CONTAINER_VARIABLE(48),
    GET_INDEX(16),
    GET_PROPERTY(17),
    GREATER_THAN(18),
    GREATER_THAN_EQUALS(19),
    IDENTITY_EQUALS(20),
    IDENTITY_NOT_EQUALS(21),
    IF(22),
    LESS_THAN(23),
    LESS_THAN_EQUALS(24),
    MODULUS(25),
    MULTIPLY(26),
    NEGATE(27),
    NOT(28),
    NOT_EQUALS(29),
    NULL(45),
    OR(30),
    /* JADX INFO: Fake field, exist only in values array */
    PLUS_EQUALS(31),
    POST_DECREMENT(32),
    POST_INCREMENT(33),
    QUOTE(46),
    PRE_DECREMENT(34),
    PRE_INCREMENT(35),
    RETURN(36),
    SET_PROPERTY(43),
    SUBTRACT(37),
    SWITCH(38),
    TERNARY(39),
    TYPEOF(40),
    UNDEFINED(44),
    VAR(41),
    WHILE(42);


    /* renamed from: l0, reason: collision with root package name */
    public static final HashMap f32895l0 = new HashMap();

    /* renamed from: a, reason: collision with root package name */
    public final int f32909a;

    static {
        for (o6 o6Var : values()) {
            f32895l0.put(Integer.valueOf(o6Var.f32909a), o6Var);
        }
    }

    o6(int i5) {
        this.f32909a = i5;
    }

    @Override // java.lang.Enum
    public final String toString() {
        return Integer.valueOf(this.f32909a).toString();
    }
}
