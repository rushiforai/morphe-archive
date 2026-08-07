.class public final synthetic Ll/xn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lv/VEditText;

.field public final synthetic b:Lv/VEditText;

.field public final synthetic c:Lv/VButton;


# direct methods
.method public synthetic constructor <init>(Lv/VEditText;Lv/VEditText;Lv/VButton;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xn;->a:Lv/VEditText;

    iput-object p2, p0, Ll/xn;->b:Lv/VEditText;

    iput-object p3, p0, Ll/xn;->c:Lv/VButton;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xn;->a:Lv/VEditText;

    iget-object v1, p0, Ll/xn;->b:Lv/VEditText;

    iget-object p0, p0, Ll/xn;->c:Lv/VButton;

    check-cast p1, Ljava/lang/CharSequence;

    invoke-static {v0, v1, p0, p1}, Ll/zn;->x(Lv/VEditText;Lv/VEditText;Lv/VButton;Ljava/lang/CharSequence;)V

    return-void
.end method
