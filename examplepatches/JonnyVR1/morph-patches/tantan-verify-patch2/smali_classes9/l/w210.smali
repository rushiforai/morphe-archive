.class public final synthetic Ll/w210;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/s310;

.field public final synthetic b:Ljava/util/ArrayList;


# direct methods
.method public synthetic constructor <init>(Ll/s310;Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/w210;->a:Ll/s310;

    iput-object p2, p0, Ll/w210;->b:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/w210;->a:Ll/s310;

    iget-object p0, p0, Ll/w210;->b:Ljava/util/ArrayList;

    invoke-static {v0, p0}, Ll/s310;->q(Ll/s310;Ljava/util/ArrayList;)V

    return-void
.end method
