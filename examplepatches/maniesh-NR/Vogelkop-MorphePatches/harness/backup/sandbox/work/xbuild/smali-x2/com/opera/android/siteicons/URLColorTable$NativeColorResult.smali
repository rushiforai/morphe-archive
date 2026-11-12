.class public Lcom/opera/android/siteicons/URLColorTable$NativeColorResult;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/opera/android/siteicons/URLColorTable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "NativeColorResult"
.end annotation


# instance fields
.field public final a:Loa5;

.field public final b:Z


# direct methods
.method public constructor <init>(IIZ)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Loa5;

    invoke-direct {v0, p1, p2}, Loa5;-><init>(II)V

    iput-object v0, p0, Lcom/opera/android/siteicons/URLColorTable$NativeColorResult;->a:Loa5;

    iput-boolean p3, p0, Lcom/opera/android/siteicons/URLColorTable$NativeColorResult;->b:Z

    return-void
.end method
