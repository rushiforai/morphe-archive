.class public final synthetic Ll/ic50;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/lc50;


# direct methods
.method public synthetic constructor <init>(Ll/lc50;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ic50;->a:Ll/lc50;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ic50;->a:Ll/lc50;

    check-cast p1, Ljava/lang/Boolean;

    invoke-static {p0, p1}, Ll/lc50;->T3(Ll/lc50;Ljava/lang/Boolean;)V

    return-void
.end method
