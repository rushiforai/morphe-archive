.class public final synthetic Ll/aq40;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/iq40;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/iq40;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/aq40;->a:Ll/iq40;

    iput-object p2, p0, Ll/aq40;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/aq40;->a:Ll/iq40;

    iget-object p0, p0, Ll/aq40;->b:Ljava/lang/String;

    check-cast p1, Ll/bkj0;

    invoke-static {v0, p0, p1}, Ll/iq40;->j(Ll/iq40;Ljava/lang/String;Ll/bkj0;)V

    return-void
.end method
