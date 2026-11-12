.class public final Lt0f;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:Landroid/graphics/Bitmap;

.field public final c:Ljava/lang/CharSequence;

.field public final d:Landroid/app/PendingIntent;

.field public final e:I

.field public final f:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/graphics/Bitmap;Ljava/lang/CharSequence;Landroid/app/PendingIntent;ILjava/lang/String;)V
    .registers 7

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 22
    iput v0, p0, Lt0f;->a:I

    .line 23
    iput-object p1, p0, Lt0f;->b:Landroid/graphics/Bitmap;

    .line 24
    iput-object p2, p0, Lt0f;->c:Ljava/lang/CharSequence;

    .line 25
    iput-object p3, p0, Lt0f;->d:Landroid/app/PendingIntent;

    .line 26
    iput p4, p0, Lt0f;->e:I

    .line 27
    iput-object p5, p0, Lt0f;->f:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/CharSequence;Landroid/app/PendingIntent;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const v0, 0x7f080472

    iput v0, p0, Lt0f;->a:I

    const/4 v0, 0x0

    iput-object v0, p0, Lt0f;->b:Landroid/graphics/Bitmap;

    iput-object p1, p0, Lt0f;->c:Ljava/lang/CharSequence;

    iput-object p2, p0, Lt0f;->d:Landroid/app/PendingIntent;

    const/4 p1, 0x1

    iput p1, p0, Lt0f;->e:I

    iput-object v0, p0, Lt0f;->f:Ljava/lang/String;

    return-void
.end method
