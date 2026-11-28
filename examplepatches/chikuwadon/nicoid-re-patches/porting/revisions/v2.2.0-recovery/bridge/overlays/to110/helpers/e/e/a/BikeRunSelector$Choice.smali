.class final Le/e/a/BikeRunSelector$Choice;
.super Ljava/lang/Object;
.source "BikeRunSelector.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field private final activity:Landroid/app/Activity;

.field private final host:Landroid/app/Dialog;


# direct methods
.method constructor <init>(Landroid/app/Activity;Landroid/app/Dialog;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/BikeRunSelector$Choice;->activity:Landroid/app/Activity;

    iput-object p2, p0, Le/e/a/BikeRunSelector$Choice;->host:Landroid/app/Dialog;

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 4

    if-ltz p2, :cond_2

    const/4 v0, 0x2

    if-gt p2, v0, :cond_2

    iget-object v0, p0, Le/e/a/BikeRunSelector$Choice;->host:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    iget-object v0, p0, Le/e/a/BikeRunSelector$Choice;->activity:Landroid/app/Activity;

    if-nez p2, :cond_0

    invoke-static {v0}, Le/e/a/internal/standard150/BikeRun;->open(Landroid/app/Activity;)V

    return-void

    :cond_0
    const/4 p0, 0x1

    if-ne p2, p0, :cond_1

    invoke-static {v0}, Le/e/a/BikeRun;->open(Landroid/app/Activity;)V

    return-void

    :cond_1
    invoke-static {v0}, Le/e/a/internal/classic131/BikeRun;->open(Landroid/app/Activity;)V

    :cond_2
    return-void
.end method
