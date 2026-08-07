.class public final synthetic Ll/im90;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/km90;


# direct methods
.method public synthetic constructor <init>(Ll/km90;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/im90;->a:Ll/km90;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/im90;->a:Ll/km90;

    check-cast p1, Lv/VText;

    invoke-static {p0, p1}, Ll/km90;->R(Ll/km90;Lv/VText;)V

    return-void
.end method
