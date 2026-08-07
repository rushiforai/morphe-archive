.class public abstract Lcom/p1/mobile/android/app/c$c;
.super Lcom/p1/mobile/android/app/c;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/android/app/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "c"
.end annotation


# instance fields
.field public final p:Landroid/os/Bundle;


# direct methods
.method public constructor <init>(Ljava/lang/String;Landroid/os/Bundle;ZZ)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-direct {p0, p1, v0, p3, p4}, Lcom/p1/mobile/android/app/c;-><init>(Ljava/lang/String;ZZZ)V

    .line 3
    .line 4
    .line 5
    iput-object p2, p0, Lcom/p1/mobile/android/app/c$c;->p:Landroid/os/Bundle;

    .line 6
    .line 7
    return-void
.end method
