.class public final synthetic Ll/rgo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/tgo;

.field public final synthetic b:Lv/VText_NoTopPadding;


# direct methods
.method public synthetic constructor <init>(Ll/tgo;Lv/VText_NoTopPadding;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rgo;->a:Ll/tgo;

    iput-object p2, p0, Ll/rgo;->b:Lv/VText_NoTopPadding;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/rgo;->a:Ll/tgo;

    iget-object p0, p0, Ll/rgo;->b:Lv/VText_NoTopPadding;

    invoke-static {v0, p0}, Ll/tgo;->e(Ll/tgo;Lv/VText_NoTopPadding;)V

    return-void
.end method
