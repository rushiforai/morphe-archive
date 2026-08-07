.class public final synthetic Ll/hl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Dialog;

.field public final synthetic b:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Dialog;Ll/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hl;->a:Lcom/p1/mobile/android/app/Dialog;

    iput-object p2, p0, Ll/hl;->b:Ll/y20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hl;->a:Lcom/p1/mobile/android/app/Dialog;

    iget-object p0, p0, Ll/hl;->b:Ll/y20;

    check-cast p1, Landroid/util/Pair;

    invoke-static {v0, p0, p1}, Ll/sm;->N(Lcom/p1/mobile/android/app/Dialog;Ll/y20;Landroid/util/Pair;)V

    return-void
.end method
