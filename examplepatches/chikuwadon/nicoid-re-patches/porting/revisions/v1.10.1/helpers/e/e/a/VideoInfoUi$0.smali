.class public final synthetic Le/e/a/VideoInfoUi$0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Le/e/a/VideoInfoCounts$Values;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Landroid/os/BaseBundle;"
    method = "getString"
    proto = "(Ljava/lang/String;)Ljava/lang/String;"
.end annotation


# instance fields
.field public final synthetic f$0:Landroid/os/Bundle;


# direct methods
.method public synthetic constructor <init>(Landroid/os/Bundle;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/VideoInfoUi$0;->f$0:Landroid/os/Bundle;

    return-void
.end method


# virtual methods
.method public final get(Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    .line 0
    iget-object v0, p0, Le/e/a/VideoInfoUi$0;->f$0:Landroid/os/Bundle;

    invoke-virtual {v0, p1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method
