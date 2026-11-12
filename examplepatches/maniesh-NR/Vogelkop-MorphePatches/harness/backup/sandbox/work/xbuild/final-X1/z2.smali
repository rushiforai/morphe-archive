.class public final Lz2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lq6j;


# static fields
.field public static final a:Lz2;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lz2;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lz2;->a:Lz2;

    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;)Ljava/lang/String;
    .registers 3

    const p0, 0x7f1401b7

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    const v0, 0x7f140f47

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p1, v0, p0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
