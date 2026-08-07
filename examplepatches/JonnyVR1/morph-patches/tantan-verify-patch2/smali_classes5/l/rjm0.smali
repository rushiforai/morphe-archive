.class public final synthetic Ll/rjm0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/l4g0;

.field public final synthetic b:Ll/sjm0;


# direct methods
.method public synthetic constructor <init>(Ll/l4g0;Ll/sjm0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rjm0;->a:Ll/l4g0;

    iput-object p2, p0, Ll/rjm0;->b:Ll/sjm0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/rjm0;->a:Ll/l4g0;

    iget-object p0, p0, Ll/rjm0;->b:Ll/sjm0;

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    invoke-static {v0, p0, p1}, Ll/sjm0;->d(Ll/l4g0;Ll/sjm0;Z)V

    return-void
.end method
