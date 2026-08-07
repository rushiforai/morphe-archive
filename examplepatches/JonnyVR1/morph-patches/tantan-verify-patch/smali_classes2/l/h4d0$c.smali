.class public Ll/h4d0$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/se00;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/h4d0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "c"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/se00<",
        "Ljava/lang/Integer;",
        "Ljava/io/InputStream;",
        ">;"
    }
.end annotation


# instance fields
.field private final a:Landroid/content/res/Resources;


# direct methods
.method public constructor <init>(Landroid/content/res/Resources;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/h4d0$c;->a:Landroid/content/res/Resources;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public b(Ll/qs10;)Ll/re00;
    .locals 3
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/qs10;",
            ")",
            "Ll/re00<",
            "Ljava/lang/Integer;",
            "Ljava/io/InputStream;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/h4d0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/h4d0$c;->a:Landroid/content/res/Resources;

    .line 4
    .line 5
    const-class v1, Landroid/net/Uri;

    .line 6
    .line 7
    const-class v2, Ljava/io/InputStream;

    .line 8
    .line 9
    invoke-virtual {p1, v1, v2}, Ll/qs10;->d(Ljava/lang/Class;Ljava/lang/Class;)Ll/re00;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-direct {v0, p0, p1}, Ll/h4d0;-><init>(Landroid/content/res/Resources;Ll/re00;)V

    .line 14
    .line 15
    .line 16
    return-object v0
.end method
