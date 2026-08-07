.class public final synthetic Ll/mne;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/xne;


# direct methods
.method public synthetic constructor <init>(Ll/xne;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mne;->a:Ll/xne;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mne;->a:Ll/xne;

    check-cast p1, Lv/VText;

    invoke-static {p0, p1}, Ll/xne;->s0(Ll/xne;Lv/VText;)V

    return-void
.end method
