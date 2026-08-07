.class public Ll/bbl$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/bbl;->e(Ll/p8l$a;Lcom/p1/mobile/putong/core/data/MigrateAwardDialogData;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Dialog;

.field public final synthetic b:Ljava/util/HashMap;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Dialog;Ljava/util/HashMap;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/bbl$a;->a:Lcom/p1/mobile/android/app/Dialog;

    .line 2
    .line 3
    iput-object p2, p0, Ll/bbl$a;->b:Ljava/util/HashMap;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/bbl$a;->a:Lcom/p1/mobile/android/app/Dialog;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/g1e;->dismiss()V

    .line 4
    .line 5
    .line 6
    const-string p1, "p_clone_get_free_privilege"

    .line 7
    .line 8
    iget-object p0, p0, Ll/bbl$a;->b:Ljava/util/HashMap;

    .line 9
    .line 10
    const-string v0, "e_clone_privilege_get_it_now"

    .line 11
    .line 12
    invoke-static {v0, p1, p0}, Ll/i4g0;->s(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method
