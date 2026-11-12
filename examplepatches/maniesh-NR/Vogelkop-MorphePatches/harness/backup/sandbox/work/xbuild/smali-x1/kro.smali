.class public interface abstract Lkro;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Lkqo;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lkqo;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lkqo;-><init>(B)V

    sput-object v0, Lkro;->a:Lkqo;

    return-void
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .registers 1

    .line 8
    const/4 p0, 0x0

    return-object p0
.end method

.method public a(Ljava/lang/String;)V
    .registers 2

    .line 9
    return-void
.end method

.method public a(I)Z
    .registers 2

    const/16 p0, 0xc8

    if-ne p1, p0, :cond_6

    const/4 p0, 0x1

    return p0

    :cond_6
    const/4 p0, 0x0

    return p0
.end method

.method public abstract b(Ljava/io/InputStream;)Ljava/lang/Object;
.end method
