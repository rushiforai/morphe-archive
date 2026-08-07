.class public final synthetic Ll/rep;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/tep;

.field public final synthetic b:Ll/mkj;


# direct methods
.method public synthetic constructor <init>(Ll/tep;Ll/mkj;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rep;->a:Ll/tep;

    iput-object p2, p0, Ll/rep;->b:Ll/mkj;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/rep;->a:Ll/tep;

    iget-object p0, p0, Ll/rep;->b:Ll/mkj;

    check-cast p1, Ljava/lang/Boolean;

    invoke-static {v0, p0, p1}, Ll/tep;->a4(Ll/tep;Ll/mkj;Ljava/lang/Boolean;)V

    return-void
.end method
