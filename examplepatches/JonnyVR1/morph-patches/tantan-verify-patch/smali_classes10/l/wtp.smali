.class public final synthetic Ll/wtp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/iup;

.field public final synthetic b:Ll/xup;


# direct methods
.method public synthetic constructor <init>(Ll/iup;Ll/xup;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wtp;->a:Ll/iup;

    iput-object p2, p0, Ll/wtp;->b:Ll/xup;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wtp;->a:Ll/iup;

    iget-object p0, p0, Ll/wtp;->b:Ll/xup;

    invoke-static {v0, p0}, Ll/iup;->w0(Ll/iup;Ll/xup;)V

    return-void
.end method
