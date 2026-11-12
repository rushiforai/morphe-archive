.class public final Lf39;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/app/assist/AssistStructure$ViewNode;

.field public final b:Lnf2;

.field public final c:Lp09;


# direct methods
.method public constructor <init>(Landroid/app/assist/AssistStructure$ViewNode;Lnf2;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lf39;->a:Landroid/app/assist/AssistStructure$ViewNode;

    iput-object p2, p0, Lf39;->b:Lnf2;

    sget-object p2, Lp09;->a:Lir5;

    invoke-virtual {p1}, Landroid/app/assist/AssistStructure$ViewNode;->getAutofillType()I

    move-result p1

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 p2, 0x1

    if-eq p1, p2, :cond_28

    const/4 p2, 0x2

    if-eq p1, p2, :cond_25

    const/4 p2, 0x3

    if-eq p1, p2, :cond_22

    const/4 p2, 0x4

    if-eq p1, p2, :cond_1f

    sget-object p1, Lp09;->b:Lk09;

    goto :goto_2a

    :cond_1f
    sget-object p1, Lp09;->d:Li09;

    goto :goto_2a

    :cond_22
    sget-object p1, Lp09;->f:Lj09;

    goto :goto_2a

    :cond_25
    sget-object p1, Lp09;->e:Lm09;

    goto :goto_2a

    :cond_28
    sget-object p1, Lp09;->c:Ll09;

    :goto_2a
    iput-object p1, p0, Lf39;->c:Lp09;

    return-void
.end method

.method public static a(Lf39;Lnf2;I)Lvz8;
    .registers 10

    iget-object v0, p0, Lf39;->a:Landroid/app/assist/AssistStructure$ViewNode;

    invoke-virtual {v0}, Landroid/app/assist/AssistStructure$ViewNode;->getAutofillId()Landroid/view/autofill/AutofillId;

    move-result-object v2

    iget-object v0, p0, Lf39;->a:Landroid/app/assist/AssistStructure$ViewNode;

    invoke-virtual {v0}, Landroid/app/assist/AssistStructure$ViewNode;->getAutofillValue()Landroid/view/autofill/AutofillValue;

    move-result-object v0

    sget-object v1, Lu09;->a:Lu09;

    if-eqz v0, :cond_1b

    invoke-virtual {v0}, Landroid/view/autofill/AutofillValue;->isText()Z

    move-result v3

    if-eqz v3, :cond_1d

    new-instance v1, Lv09;

    invoke-direct {v1, v0}, Lv09;-><init>(Landroid/view/autofill/AutofillValue;)V

    :cond_1b
    :goto_1b
    move-object v3, v1

    goto :goto_41

    :cond_1d
    invoke-virtual {v0}, Landroid/view/autofill/AutofillValue;->isDate()Z

    move-result v3

    if-eqz v3, :cond_29

    new-instance v1, Ls09;

    invoke-direct {v1, v0}, Ls09;-><init>(Landroid/view/autofill/AutofillValue;)V

    goto :goto_1b

    :cond_29
    invoke-virtual {v0}, Landroid/view/autofill/AutofillValue;->isToggle()Z

    move-result v3

    if-eqz v3, :cond_35

    new-instance v1, Lw09;

    invoke-direct {v1, v0}, Lw09;-><init>(Landroid/view/autofill/AutofillValue;)V

    goto :goto_1b

    :cond_35
    invoke-virtual {v0}, Landroid/view/autofill/AutofillValue;->isList()Z

    move-result v3

    if-eqz v3, :cond_1b

    new-instance v1, Lt09;

    invoke-direct {v1, v0}, Lt09;-><init>(Landroid/view/autofill/AutofillValue;)V

    goto :goto_1b

    :goto_41
    and-int/lit8 p2, p2, 0x4

    if-eqz p2, :cond_47

    iget-object p1, p0, Lf39;->b:Lnf2;

    :cond_47
    move-object v4, p1

    iget-object v5, p0, Lf39;->c:Lp09;

    iget-object p1, p0, Lf39;->a:Landroid/app/assist/AssistStructure$ViewNode;

    invoke-virtual {p1}, Landroid/app/assist/AssistStructure$ViewNode;->isFocused()Z

    move-result v6

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 p0, 0x0

    const-string p1, "Required value was null."

    if-eqz v2, :cond_64

    if-eqz v4, :cond_60

    new-instance v1, Lvz8;

    invoke-direct/range {v1 .. v6}, Lvz8;-><init>(Landroid/view/autofill/AutofillId;Lx09;Lnf2;Lp09;Z)V

    return-object v1

    :cond_60
    invoke-static {p1}, Lqp2;->n(Ljava/lang/String;)V

    return-object p0

    :cond_64
    invoke-static {p1}, Lqp2;->n(Ljava/lang/String;)V

    return-object p0
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_1a

    instance-of v0, p1, Lf39;

    if-eqz v0, :cond_18

    check-cast p1, Lf39;

    iget-object v0, p0, Lf39;->a:Landroid/app/assist/AssistStructure$ViewNode;

    iget-object v1, p1, Lf39;->a:Landroid/app/assist/AssistStructure$ViewNode;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_18

    iget-object p0, p0, Lf39;->b:Lnf2;

    iget-object p1, p1, Lf39;->b:Lnf2;

    if-eq p0, p1, :cond_1a

    :cond_18
    const/4 p0, 0x0

    return p0

    :cond_1a
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 2

    iget-object v0, p0, Lf39;->a:Landroid/app/assist/AssistStructure$ViewNode;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object p0, p0, Lf39;->b:Lnf2;

    if-nez p0, :cond_e

    const/4 p0, 0x0

    goto :goto_12

    :cond_e
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    :goto_12
    add-int/2addr v0, p0

    return v0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
