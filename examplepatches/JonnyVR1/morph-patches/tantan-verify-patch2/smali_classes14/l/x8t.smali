.class public final synthetic Ll/x8t;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/z8t;


# direct methods
.method public synthetic constructor <init>(Ll/z8t;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/x8t;->a:Ll/z8t;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/x8t;->a:Ll/z8t;

    check-cast p1, Ljava/lang/Boolean;

    invoke-static {p0, p1}, Ll/z8t;->R2(Ll/z8t;Ljava/lang/Boolean;)V

    return-void
.end method
