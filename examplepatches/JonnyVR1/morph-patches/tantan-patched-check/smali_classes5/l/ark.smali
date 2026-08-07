.class public final synthetic Ll/ark;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lv/VText;

.field public final synthetic b:Lv/VButton;


# direct methods
.method public synthetic constructor <init>(Lv/VText;Lv/VButton;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ark;->a:Lv/VText;

    iput-object p2, p0, Ll/ark;->b:Lv/VButton;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ark;->a:Lv/VText;

    iget-object p0, p0, Ll/ark;->b:Lv/VButton;

    check-cast p1, Ljava/lang/CharSequence;

    invoke-static {v0, p0, p1}, Ll/qtk;->F(Lv/VText;Lv/VButton;Ljava/lang/CharSequence;)V

    return-void
.end method
