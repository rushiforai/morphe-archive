.class public final synthetic Ll/emm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/fmm;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/fmm;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/emm;->a:Ll/fmm;

    iput-object p2, p0, Ll/emm;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/emm;->a:Ll/fmm;

    iget-object p0, p0, Ll/emm;->b:Ljava/lang/String;

    check-cast p1, Ljava/lang/Boolean;

    invoke-static {v0, p0, p1}, Ll/fmm;->o0(Ll/fmm;Ljava/lang/String;Ljava/lang/Boolean;)V

    return-void
.end method
