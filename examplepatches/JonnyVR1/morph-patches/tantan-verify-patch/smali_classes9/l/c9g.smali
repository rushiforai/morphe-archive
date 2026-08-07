.class public final synthetic Ll/c9g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/d9g;

.field public final synthetic b:Ll/vvl;


# direct methods
.method public synthetic constructor <init>(Ll/d9g;Ll/vvl;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/c9g;->a:Ll/d9g;

    iput-object p2, p0, Ll/c9g;->b:Ll/vvl;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/c9g;->a:Ll/d9g;

    iget-object p0, p0, Ll/c9g;->b:Ll/vvl;

    check-cast p1, Ll/a8g;

    invoke-static {v0, p0, p1}, Ll/d9g;->Y3(Ll/d9g;Ll/vvl;Ll/a8g;)V

    return-void
.end method
