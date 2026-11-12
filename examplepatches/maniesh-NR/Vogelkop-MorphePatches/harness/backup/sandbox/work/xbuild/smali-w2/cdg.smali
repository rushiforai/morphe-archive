.class public final Lcdg;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll5b;

.field public final b:Ll5b;

.field public final c:Ll5b;


# direct methods
.method public constructor <init>()V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ll5b;

    const/4 v1, 0x6

    invoke-direct {v0, v1}, Ll5b;-><init>(B)V

    iput-object v0, p0, Lcdg;->a:Ll5b;

    new-instance v0, Ll5b;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Ll5b;-><init>(B)V

    iput-object v0, p0, Lcdg;->b:Ll5b;

    new-instance v0, Ll5b;

    invoke-direct {v0, v1}, Ll5b;-><init>(B)V

    iput-object v0, p0, Lcdg;->c:Ll5b;

    return-void
.end method
