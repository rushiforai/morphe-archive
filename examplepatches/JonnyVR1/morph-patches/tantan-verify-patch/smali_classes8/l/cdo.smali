.class public final synthetic Ll/cdo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/edo;

.field public final synthetic b:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Ll/edo;Ll/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cdo;->a:Ll/edo;

    iput-object p2, p0, Ll/cdo;->b:Ll/y20;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cdo;->a:Ll/edo;

    iget-object p0, p0, Ll/cdo;->b:Ll/y20;

    invoke-static {v0, p0}, Ll/edo;->a(Ll/edo;Ll/y20;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
