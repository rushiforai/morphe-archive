.class public final synthetic Ll/alf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/clf;

.field public final synthetic b:Z

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/clf;ZLjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/alf;->a:Ll/clf;

    iput-boolean p2, p0, Ll/alf;->b:Z

    iput-object p3, p0, Ll/alf;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/alf;->a:Ll/clf;

    iget-boolean v1, p0, Ll/alf;->b:Z

    iget-object p0, p0, Ll/alf;->c:Ljava/lang/String;

    check-cast p1, Ljava/lang/Boolean;

    invoke-static {v0, v1, p0, p1}, Ll/clf;->h0(Ll/clf;ZLjava/lang/String;Ljava/lang/Boolean;)V

    return-void
.end method
