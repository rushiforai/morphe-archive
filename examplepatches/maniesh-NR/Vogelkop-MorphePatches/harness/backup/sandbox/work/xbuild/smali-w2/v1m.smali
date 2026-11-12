.class public final Lv1m;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lw1m;


# static fields
.field public static final a:Lv1m;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lv1m;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lv1m;->a:Lv1m;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 3

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of p0, p1, Lv1m;

    if-nez p0, :cond_a

    const/4 p0, 0x0

    return p0

    :cond_a
    return v0
.end method

.method public final hashCode()I
    .registers 1

    const p0, -0x66645fb

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
