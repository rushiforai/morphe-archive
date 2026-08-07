.class public final synthetic Ll/mx0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:F


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;F)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mx0;->a:Lcom/p1/mobile/android/app/Act;

    iput p2, p0, Ll/mx0;->b:F

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/mx0;->a:Lcom/p1/mobile/android/app/Act;

    iget p0, p0, Ll/mx0;->b:F

    invoke-static {v0, p0}, Ll/tx0;->e(Lcom/p1/mobile/android/app/Act;F)V

    return-void
.end method
