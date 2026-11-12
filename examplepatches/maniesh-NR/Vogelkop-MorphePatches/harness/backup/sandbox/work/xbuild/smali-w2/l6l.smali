.class public final Ll6l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lj6l;


# instance fields
.field public final synthetic a:Lm6l;


# direct methods
.method public constructor <init>(Lm6l;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll6l;->a:Lm6l;

    return-void
.end method


# virtual methods
.method public final onDestroy()V
    .registers 2

    iget-object p0, p0, Ll6l;->a:Lm6l;

    iget-object p0, p0, Lm6l;->a:Lode;

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lekc;->r(Ljava/lang/Object;)V

    return-void
.end method
