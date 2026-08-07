.class public final Ll/v6c$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/se00;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/v6c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "c"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Model:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ll/se00<",
        "TModel;",
        "Ljava/io/InputStream;",
        ">;"
    }
.end annotation


# instance fields
.field private final a:Ll/v6c$a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/v6c$a<",
            "Ljava/io/InputStream;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/v6c$c$a;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/v6c$c$a;-><init>(Ll/v6c$c;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/v6c$c;->a:Ll/v6c$a;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public b(Ll/qs10;)Ll/re00;
    .locals 0
    .param p1    # Ll/qs10;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/qs10;",
            ")",
            "Ll/re00<",
            "TModel;",
            "Ljava/io/InputStream;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance p1, Ll/v6c;

    .line 2
    .line 3
    iget-object p0, p0, Ll/v6c$c;->a:Ll/v6c$a;

    .line 4
    .line 5
    invoke-direct {p1, p0}, Ll/v6c;-><init>(Ll/v6c$a;)V

    .line 6
    .line 7
    .line 8
    return-object p1
.end method
