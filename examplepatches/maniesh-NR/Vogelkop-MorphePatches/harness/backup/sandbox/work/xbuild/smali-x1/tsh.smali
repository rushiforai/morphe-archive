.class public final Ltsh;
.super Lz85;
.source "SourceFile"


# instance fields
.field public final g:Laum;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object v0, Laum;->d:Laum;

    if-nez v0, :cond_e

    new-instance v0, Laum;

    invoke-direct {v0, p1}, Laum;-><init>(Landroid/content/Context;)V

    sput-object v0, Laum;->d:Laum;

    :cond_e
    iput-object v0, p0, Ltsh;->g:Laum;

    return-void
.end method
