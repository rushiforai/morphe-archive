.class public final synthetic Ll/xan;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/z20;

.field public final synthetic b:Lv/VEditText;

.field public final synthetic c:Lcom/p1/mobile/android/app/Dialog;


# direct methods
.method public synthetic constructor <init>(Ll/z20;Lv/VEditText;Lcom/p1/mobile/android/app/Dialog;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xan;->a:Ll/z20;

    iput-object p2, p0, Ll/xan;->b:Lv/VEditText;

    iput-object p3, p0, Ll/xan;->c:Lcom/p1/mobile/android/app/Dialog;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xan;->a:Ll/z20;

    iget-object v1, p0, Ll/xan;->b:Lv/VEditText;

    iget-object p0, p0, Ll/xan;->c:Lcom/p1/mobile/android/app/Dialog;

    invoke-static {v0, v1, p0}, Ll/ebn;->k(Ll/z20;Lv/VEditText;Lcom/p1/mobile/android/app/Dialog;)V

    return-void
.end method
