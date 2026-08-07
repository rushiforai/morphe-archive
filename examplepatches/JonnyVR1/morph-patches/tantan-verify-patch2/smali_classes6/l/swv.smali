.class public final synthetic Ll/swv;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/vwv;

.field public final synthetic b:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Ll/vwv;Ll/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/swv;->a:Ll/vwv;

    iput-object p2, p0, Ll/swv;->b:Ll/y20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/swv;->a:Ll/vwv;

    iget-object p0, p0, Ll/swv;->b:Ll/y20;

    check-cast p1, Ljava/util/List;

    invoke-static {v0, p0, p1}, Ll/vwv;->W(Ll/vwv;Ll/y20;Ljava/util/List;)V

    return-void
.end method
