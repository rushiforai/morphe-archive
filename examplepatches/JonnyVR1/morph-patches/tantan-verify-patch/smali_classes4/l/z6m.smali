.class public interface abstract Ll/z6m;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    invoke-static {}, Ll/gra;->z()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const v0, -0xb2b2b3

    .line 8
    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/high16 v0, -0x67000000

    .line 12
    .line 13
    :goto_0
    sput v0, Ll/z6m;->a:I

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public abstract a(Ll/sj6;Lcom/p1/mobile/putong/core/data/Message;)Z
.end method

.method public abstract b(Ll/sj6;Lcom/p1/mobile/putong/core/data/Message;)Ljava/lang/CharSequence;
.end method

.method public c(Ljava/lang/String;)Ljava/lang/CharSequence;
    .locals 0

    .line 1
    invoke-static {p1}, Ll/jsi0;->b(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const-string p0, ""

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    sget p0, Ll/z6m;->a:I

    .line 11
    .line 12
    invoke-static {p1, p0}, Ll/c17;->s0(Ljava/lang/String;I)Ljava/lang/CharSequence;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method
