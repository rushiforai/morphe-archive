.class public Lmx3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrim;


# instance fields
.field public final a:Lzp1;

.field public final b:Lab;


# direct methods
.method public constructor <init>(Lzp1;Lab;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lmx3;->a:Lzp1;

    iput-object p2, p0, Lmx3;->b:Lab;

    invoke-virtual {p1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p0

    invoke-static {p0}, Lq9n;->i(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public a()V
    .registers 1

    return-void
.end method
