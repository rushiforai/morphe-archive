.class public final synthetic Ll/yqk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lv/VText;

.field public final synthetic b:Lv/VEditText;


# direct methods
.method public synthetic constructor <init>(Lv/VText;Lv/VEditText;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yqk;->a:Lv/VText;

    iput-object p2, p0, Ll/yqk;->b:Lv/VEditText;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/yqk;->a:Lv/VText;

    iget-object p0, p0, Ll/yqk;->b:Lv/VEditText;

    invoke-static {v0, p0}, Ll/qtk;->i0(Lv/VText;Lv/VEditText;)V

    return-void
.end method
