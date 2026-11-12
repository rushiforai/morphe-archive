.class public final Ll78;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lm78;


# static fields
.field public static final a:Ll78;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Ll78;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Ll78;->a:Ll78;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 3

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of p0, p1, Ll78;

    if-nez p0, :cond_a

    const/4 p0, 0x0

    return p0

    :cond_a
    return v0
.end method

.method public final hashCode()I
    .registers 1

    const p0, -0x35b8c440    # -3264240.0f

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
