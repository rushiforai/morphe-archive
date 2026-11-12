.class public final Lfu1;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:I

.field public final c:I

.field public final d:Landroid/app/PendingIntent;

.field public e:Z


# direct methods
.method public constructor <init>(IIIJJLandroid/app/PendingIntent;Landroid/app/PendingIntent;Landroid/app/PendingIntent;Landroid/app/PendingIntent;Ljava/util/HashMap;)V
    .registers 13

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p4, 0x0

    iput-boolean p4, p0, Lfu1;->e:Z

    iput p1, p0, Lfu1;->a:I

    iput p2, p0, Lfu1;->b:I

    iput p3, p0, Lfu1;->c:I

    iput-object p9, p0, Lfu1;->d:Landroid/app/PendingIntent;

    return-void
.end method
