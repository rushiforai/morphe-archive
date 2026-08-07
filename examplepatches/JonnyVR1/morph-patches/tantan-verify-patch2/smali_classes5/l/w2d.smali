.class public final synthetic Ll/w2d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lv/VEditText;


# direct methods
.method public synthetic constructor <init>(Lv/VEditText;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/w2d;->a:Lv/VEditText;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w2d;->a:Lv/VEditText;

    invoke-static {p0}, Lcom/p1/mobile/putong/core/util/DebugUtil;->Pb(Lv/VEditText;)V

    return-void
.end method
