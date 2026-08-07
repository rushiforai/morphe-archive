.class public Ll/wml$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/se00;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/wml;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/se00<",
        "Ll/e4k;",
        "Ljava/io/InputStream;",
        ">;"
    }
.end annotation


# instance fields
.field private final a:Ll/me00;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/me00<",
            "Ll/e4k;",
            "Ll/e4k;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/me00;

    .line 5
    .line 6
    const-wide/16 v1, 0x1f4

    .line 7
    .line 8
    invoke-direct {v0, v1, v2}, Ll/me00;-><init>(J)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Ll/wml$a;->a:Ll/me00;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public b(Ll/qs10;)Ll/re00;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/qs10;",
            ")",
            "Ll/re00<",
            "Ll/e4k;",
            "Ljava/io/InputStream;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance p1, Ll/wml;

    .line 2
    .line 3
    iget-object p0, p0, Ll/wml$a;->a:Ll/me00;

    .line 4
    .line 5
    invoke-direct {p1, p0}, Ll/wml;-><init>(Ll/me00;)V

    .line 6
    .line 7
    .line 8
    return-object p1
.end method
