.class public final synthetic Ll/ygu;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/y20;

.field public final synthetic b:Ll/v3f$b;


# direct methods
.method public synthetic constructor <init>(Ll/y20;Ll/v3f$b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ygu;->a:Ll/y20;

    iput-object p2, p0, Ll/ygu;->b:Ll/v3f$b;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ygu;->a:Ll/y20;

    iget-object p0, p0, Ll/ygu;->b:Ll/v3f$b;

    invoke-static {v0, p0, p1}, Ll/ahu;->D2(Ll/y20;Ll/v3f$b;Ljava/lang/Object;)V

    return-void
.end method
