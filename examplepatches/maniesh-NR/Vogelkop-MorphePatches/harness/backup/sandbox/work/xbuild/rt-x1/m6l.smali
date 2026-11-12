.class public final Lm6l;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lode;

.field public final b:Ll6l;


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lode;

    invoke-direct {v0}, Lekc;-><init>()V

    iput-object v0, p0, Lm6l;->a:Lode;

    new-instance v0, Ll6l;

    invoke-direct {v0, p0}, Ll6l;-><init>(Lm6l;)V

    iput-object v0, p0, Lm6l;->b:Ll6l;

    return-void
.end method
