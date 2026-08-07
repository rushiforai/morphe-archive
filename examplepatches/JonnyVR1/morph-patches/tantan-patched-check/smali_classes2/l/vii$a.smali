.class public Ll/vii$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/se00;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/vii;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Data:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ll/se00<",
        "Ljava/io/File;",
        "TData;>;"
    }
.end annotation


# instance fields
.field private final a:Ll/vii$d;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/vii$d<",
            "TData;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/vii$d;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/vii$d<",
            "TData;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/vii$a;->a:Ll/vii$d;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final b(Ll/qs10;)Ll/re00;
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
            "Ljava/io/File;",
            "TData;>;"
        }
    .end annotation

    .line 1
    new-instance p1, Ll/vii;

    .line 2
    .line 3
    iget-object p0, p0, Ll/vii$a;->a:Ll/vii$d;

    .line 4
    .line 5
    invoke-direct {p1, p0}, Ll/vii;-><init>(Ll/vii$d;)V

    .line 6
    .line 7
    .line 8
    return-object p1
.end method
