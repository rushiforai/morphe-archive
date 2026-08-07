.class public final synthetic Ll/z1b0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/g2b0;


# direct methods
.method public synthetic constructor <init>(Ll/g2b0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/z1b0;->a:Ll/g2b0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/z1b0;->a:Ll/g2b0;

    check-cast p1, Lv/VText_Tags;

    invoke-static {p0, p1}, Ll/g2b0;->R(Ll/g2b0;Lv/VText_Tags;)V

    return-void
.end method
