.class public abstract synthetic Lwy1;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final synthetic a:[I


# direct methods
.method static constructor <clinit>()V
    .registers 6

    invoke-static {}, Lxej;->values()[Lxej;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    const/4 v1, 0x0

    const/4 v2, 0x1

    :try_start_9
    aput v2, v0, v1
    :try_end_b
    .catch Ljava/lang/NoSuchFieldError; {:try_start_9 .. :try_end_b} :catch_b

    :catch_b
    const/4 v1, 0x2

    :try_start_c
    sget-object v3, Lxej;->b:Lxej;

    aput v1, v0, v2
    :try_end_10
    .catch Ljava/lang/NoSuchFieldError; {:try_start_c .. :try_end_10} :catch_10

    :catch_10
    const/4 v3, 0x3

    :try_start_11
    sget-object v4, Lxej;->b:Lxej;

    aput v3, v0, v1
    :try_end_15
    .catch Ljava/lang/NoSuchFieldError; {:try_start_11 .. :try_end_15} :catch_15

    :catch_15
    const/4 v4, 0x4

    :try_start_16
    sget-object v5, Lxej;->b:Lxej;

    aput v4, v0, v3
    :try_end_1a
    .catch Ljava/lang/NoSuchFieldError; {:try_start_16 .. :try_end_1a} :catch_1a

    :catch_1a
    invoke-static {}, Ldfj;->values()[Ldfj;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_21
    sget-object v5, Ldfj;->b:Ldfj;

    invoke-virtual {v5}, Ljava/lang/Enum;->ordinal()I

    move-result v5

    aput v2, v0, v5
    :try_end_29
    .catch Ljava/lang/NoSuchFieldError; {:try_start_21 .. :try_end_29} :catch_29

    :catch_29
    :try_start_29
    sget-object v2, Ldfj;->c:Ldfj;

    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    move-result v2

    aput v1, v0, v2
    :try_end_31
    .catch Ljava/lang/NoSuchFieldError; {:try_start_29 .. :try_end_31} :catch_31

    :catch_31
    :try_start_31
    sget-object v1, Ldfj;->f:Ldfj;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    aput v3, v0, v1
    :try_end_39
    .catch Ljava/lang/NoSuchFieldError; {:try_start_31 .. :try_end_39} :catch_39

    :catch_39
    :try_start_39
    sget-object v1, Ldfj;->d:Ldfj;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    aput v4, v0, v1
    :try_end_41
    .catch Ljava/lang/NoSuchFieldError; {:try_start_39 .. :try_end_41} :catch_41

    :catch_41
    :try_start_41
    sget-object v1, Ldfj;->g:Ldfj;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const/4 v2, 0x5

    aput v2, v0, v1
    :try_end_4a
    .catch Ljava/lang/NoSuchFieldError; {:try_start_41 .. :try_end_4a} :catch_4a

    :catch_4a
    :try_start_4a
    sget-object v1, Ldfj;->e:Ldfj;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const/4 v2, 0x6

    aput v2, v0, v1
    :try_end_53
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4a .. :try_end_53} :catch_53

    :catch_53
    sput-object v0, Lwy1;->a:[I

    return-void
.end method
