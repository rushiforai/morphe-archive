.class public final synthetic Ll/awx0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/fwx0;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Ll/fwx0;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/awx0;->a:Ll/fwx0;

    .line 5
    .line 6
    iput p2, p0, Ll/awx0;->b:I

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/awx0;->a:Ll/fwx0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/fwx0;->b:Ll/mwx0;

    .line 4
    .line 5
    iget p0, p0, Ll/awx0;->b:I

    .line 6
    .line 7
    invoke-static {v0, p0}, Ll/mwx0;->c(Ll/mwx0;I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
