.class public final synthetic Ll/qsk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lv/VText;

.field public final synthetic b:Lv/VEditText;

.field public final synthetic c:Lv/VText;

.field public final synthetic d:Lv/VButton;


# direct methods
.method public synthetic constructor <init>(Lv/VText;Lv/VEditText;Lv/VText;Lv/VButton;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qsk;->a:Lv/VText;

    iput-object p2, p0, Ll/qsk;->b:Lv/VEditText;

    iput-object p3, p0, Ll/qsk;->c:Lv/VText;

    iput-object p4, p0, Ll/qsk;->d:Lv/VButton;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/qsk;->a:Lv/VText;

    iget-object v1, p0, Ll/qsk;->b:Lv/VEditText;

    iget-object v2, p0, Ll/qsk;->c:Lv/VText;

    iget-object p0, p0, Ll/qsk;->d:Lv/VButton;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {v0, v1, v2, p0, p1}, Ll/qtk;->w(Lv/VText;Lv/VEditText;Lv/VText;Lv/VButton;Ljava/lang/Throwable;)V

    return-void
.end method
