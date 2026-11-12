.class public Ltim;
.super Ld63;
.source "SourceFile"


# instance fields
.field public final a:Luim;


# direct methods
.method public constructor <init>(Luim;)V
    .registers 2

    invoke-direct {p0}, Ld63;-><init>()V

    iput-object p1, p0, Ltim;->a:Luim;

    iput-object p0, p1, Luim;->b:Ltim;

    return-void
.end method


# virtual methods
.method public final createDialog(Landroid/content/Context;Lb2l;)Lrim;
    .registers 3

    iget-object p0, p0, Ltim;->a:Luim;

    return-object p0
.end method
