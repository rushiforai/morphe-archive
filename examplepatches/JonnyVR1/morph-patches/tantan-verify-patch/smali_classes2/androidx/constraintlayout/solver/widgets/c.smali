.class public Landroidx/constraintlayout/solver/widgets/c;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static a(Landroidx/constraintlayout/solver/widgets/e;Landroidx/constraintlayout/solver/c;I)V
    .locals 6

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p2, :cond_0

    .line 3
    .line 4
    iget v1, p0, Landroidx/constraintlayout/solver/widgets/e;->D0:I

    .line 5
    .line 6
    iget-object v2, p0, Landroidx/constraintlayout/solver/widgets/e;->G0:[Landroidx/constraintlayout/solver/widgets/d;

    .line 7
    .line 8
    move v3, v0

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget v1, p0, Landroidx/constraintlayout/solver/widgets/e;->E0:I

    .line 11
    .line 12
    iget-object v2, p0, Landroidx/constraintlayout/solver/widgets/e;->F0:[Landroidx/constraintlayout/solver/widgets/d;

    .line 13
    .line 14
    const/4 v3, 0x2

    .line 15
    :goto_0
    if-ge v0, v1, :cond_3

    .line 16
    .line 17
    aget-object v4, v2, v0

    .line 18
    .line 19
    invoke-virtual {v4}, Landroidx/constraintlayout/solver/widgets/d;->a()V

    .line 20
    .line 21
    .line 22
    const/4 v5, 0x4

    .line 23
    invoke-virtual {p0, v5}, Landroidx/constraintlayout/solver/widgets/e;->Y0(I)Z

    .line 24
    .line 25
    .line 26
    move-result v5

    .line 27
    if-eqz v5, :cond_1

    .line 28
    .line 29
    invoke-static {p0, p1, p2, v3, v4}, Landroidx/constraintlayout/solver/widgets/h;->b(Landroidx/constraintlayout/solver/widgets/e;Landroidx/constraintlayout/solver/c;IILandroidx/constraintlayout/solver/widgets/d;)Z

    .line 30
    .line 31
    .line 32
    move-result v5

    .line 33
    if-nez v5, :cond_2

    .line 34
    .line 35
    invoke-static {p0, p1, p2, v3, v4}, Landroidx/constraintlayout/solver/widgets/c;->b(Landroidx/constraintlayout/solver/widgets/e;Landroidx/constraintlayout/solver/c;IILandroidx/constraintlayout/solver/widgets/d;)V

    .line 36
    .line 37
    .line 38
    goto :goto_1

    .line 39
    :cond_1
    invoke-static {p0, p1, p2, v3, v4}, Landroidx/constraintlayout/solver/widgets/c;->b(Landroidx/constraintlayout/solver/widgets/e;Landroidx/constraintlayout/solver/c;IILandroidx/constraintlayout/solver/widgets/d;)V

    .line 40
    .line 41
    .line 42
    :cond_2
    :goto_1
    add-int/lit8 v0, v0, 0x1

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_3
    return-void
.end method

.method public static b(Landroidx/constraintlayout/solver/widgets/e;Landroidx/constraintlayout/solver/c;IILandroidx/constraintlayout/solver/widgets/d;)V
    .locals 35

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p4

    .line 1
    iget-object v9, v2, Landroidx/constraintlayout/solver/widgets/d;->a:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 2
    iget-object v10, v2, Landroidx/constraintlayout/solver/widgets/d;->c:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 3
    iget-object v11, v2, Landroidx/constraintlayout/solver/widgets/d;->b:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 4
    iget-object v12, v2, Landroidx/constraintlayout/solver/widgets/d;->d:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 5
    iget-object v3, v2, Landroidx/constraintlayout/solver/widgets/d;->e:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 6
    iget v4, v2, Landroidx/constraintlayout/solver/widgets/d;->k:F

    .line 7
    iget-object v5, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->E:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    aget-object v5, v5, p2

    sget-object v6, Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;->WRAP_CONTENT:Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    const/4 v13, 0x1

    if-ne v5, v6, :cond_0

    move v5, v13

    goto :goto_0

    :cond_0
    const/4 v5, 0x0

    :goto_0
    const/4 v6, 0x2

    if-nez p2, :cond_4

    .line 8
    iget v8, v3, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->l0:I

    if-nez v8, :cond_1

    move v14, v13

    goto :goto_1

    :cond_1
    const/4 v14, 0x0

    :goto_1
    if-ne v8, v13, :cond_2

    move v15, v13

    goto :goto_2

    :cond_2
    const/4 v15, 0x0

    :goto_2
    if-ne v8, v6, :cond_3

    :goto_3
    move v6, v13

    goto :goto_4

    :cond_3
    const/4 v6, 0x0

    :goto_4
    move/from16 v17, v4

    move-object v13, v9

    const/4 v8, 0x0

    goto :goto_7

    .line 9
    :cond_4
    iget v8, v3, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->m0:I

    if-nez v8, :cond_5

    move v14, v13

    goto :goto_5

    :cond_5
    const/4 v14, 0x0

    :goto_5
    if-ne v8, v13, :cond_6

    move v15, v13

    goto :goto_6

    :cond_6
    const/4 v15, 0x0

    :goto_6
    if-ne v8, v6, :cond_3

    goto :goto_3

    :goto_7
    const/16 v20, 0x0

    if-nez v8, :cond_13

    .line 10
    iget-object v4, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aget-object v4, v4, p3

    if-nez v5, :cond_8

    if-eqz v6, :cond_7

    goto :goto_8

    :cond_7
    const/16 v22, 0x4

    goto :goto_9

    :cond_8
    :goto_8
    const/16 v22, 0x1

    .line 11
    :goto_9
    invoke-virtual {v4}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d()I

    move-result v23

    .line 12
    iget-object v7, v4, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    if-eqz v7, :cond_9

    if-eq v13, v9, :cond_9

    .line 13
    invoke-virtual {v7}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d()I

    move-result v7

    add-int v23, v23, v7

    :cond_9
    move/from16 v7, v23

    if-eqz v6, :cond_a

    if-eq v13, v9, :cond_a

    if-eq v13, v11, :cond_a

    move/from16 v23, v5

    move/from16 v22, v6

    const/4 v5, 0x6

    goto :goto_a

    :cond_a
    if-eqz v14, :cond_b

    if-eqz v5, :cond_b

    move/from16 v23, v5

    move/from16 v22, v6

    const/4 v5, 0x4

    goto :goto_a

    :cond_b
    move/from16 v23, v5

    move/from16 v5, v22

    move/from16 v22, v6

    .line 14
    :goto_a
    iget-object v6, v4, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    move/from16 v24, v8

    if-eqz v6, :cond_d

    .line 15
    iget-object v8, v4, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->j:Landroidx/constraintlayout/solver/SolverVariable;

    if-ne v13, v11, :cond_c

    .line 16
    iget-object v6, v6, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->j:Landroidx/constraintlayout/solver/SolverVariable;

    move/from16 v25, v14

    const/4 v14, 0x5

    invoke-virtual {v1, v8, v6, v7, v14}, Landroidx/constraintlayout/solver/c;->i(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V

    goto :goto_b

    :cond_c
    move/from16 v25, v14

    .line 17
    iget-object v6, v6, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->j:Landroidx/constraintlayout/solver/SolverVariable;

    const/4 v14, 0x6

    invoke-virtual {v1, v8, v6, v7, v14}, Landroidx/constraintlayout/solver/c;->i(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V

    .line 18
    :goto_b
    iget-object v6, v4, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->j:Landroidx/constraintlayout/solver/SolverVariable;

    iget-object v4, v4, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    iget-object v4, v4, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->j:Landroidx/constraintlayout/solver/SolverVariable;

    invoke-virtual {v1, v6, v4, v7, v5}, Landroidx/constraintlayout/solver/c;->e(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)Landroidx/constraintlayout/solver/b;

    goto :goto_c

    :cond_d
    move/from16 v25, v14

    :goto_c
    if-eqz v23, :cond_f

    .line 19
    invoke-virtual {v13}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C()I

    move-result v4

    const/16 v5, 0x8

    if-eq v4, v5, :cond_e

    iget-object v4, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->E:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    aget-object v4, v4, p2

    sget-object v5, Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;->MATCH_CONSTRAINT:Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    if-ne v4, v5, :cond_e

    .line 20
    iget-object v4, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    add-int/lit8 v5, p3, 0x1

    aget-object v5, v4, v5

    iget-object v5, v5, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->j:Landroidx/constraintlayout/solver/SolverVariable;

    aget-object v4, v4, p3

    iget-object v4, v4, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->j:Landroidx/constraintlayout/solver/SolverVariable;

    const/4 v6, 0x0

    const/4 v14, 0x5

    invoke-virtual {v1, v5, v4, v6, v14}, Landroidx/constraintlayout/solver/c;->i(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V

    goto :goto_d

    :cond_e
    const/4 v6, 0x0

    .line 21
    :goto_d
    iget-object v4, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aget-object v4, v4, p3

    iget-object v4, v4, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->j:Landroidx/constraintlayout/solver/SolverVariable;

    iget-object v5, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aget-object v5, v5, p3

    iget-object v5, v5, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->j:Landroidx/constraintlayout/solver/SolverVariable;

    const/4 v14, 0x6

    invoke-virtual {v1, v4, v5, v6, v14}, Landroidx/constraintlayout/solver/c;->i(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V

    .line 22
    :cond_f
    iget-object v4, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    add-int/lit8 v5, p3, 0x1

    aget-object v4, v4, v5

    iget-object v4, v4, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    if-eqz v4, :cond_11

    .line 23
    iget-object v4, v4, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->b:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 24
    iget-object v5, v4, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aget-object v5, v5, p3

    iget-object v5, v5, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    if-eqz v5, :cond_11

    iget-object v5, v5, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->b:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    if-eq v5, v13, :cond_10

    goto :goto_e

    :cond_10
    move-object/from16 v20, v4

    :cond_11
    :goto_e
    if-eqz v20, :cond_12

    move-object/from16 v13, v20

    move/from16 v8, v24

    goto :goto_f

    :cond_12
    const/4 v8, 0x1

    :goto_f
    move/from16 v6, v22

    move/from16 v5, v23

    move/from16 v14, v25

    goto/16 :goto_7

    :cond_13
    move/from16 v23, v5

    move/from16 v22, v6

    move/from16 v25, v14

    if-eqz v12, :cond_14

    .line 25
    iget-object v4, v10, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    add-int/lit8 v5, p3, 0x1

    aget-object v4, v4, v5

    iget-object v4, v4, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    if-eqz v4, :cond_14

    .line 26
    iget-object v6, v12, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aget-object v5, v6, v5

    .line 27
    iget-object v6, v5, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->j:Landroidx/constraintlayout/solver/SolverVariable;

    iget-object v4, v4, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->j:Landroidx/constraintlayout/solver/SolverVariable;

    .line 28
    invoke-virtual {v5}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d()I

    move-result v5

    neg-int v5, v5

    const/4 v14, 0x5

    .line 29
    invoke-virtual {v1, v6, v4, v5, v14}, Landroidx/constraintlayout/solver/c;->k(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V

    goto :goto_10

    :cond_14
    const/4 v14, 0x5

    :goto_10
    if-eqz v23, :cond_15

    .line 30
    iget-object v0, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    add-int/lit8 v4, p3, 0x1

    aget-object v0, v0, v4

    iget-object v0, v0, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->j:Landroidx/constraintlayout/solver/SolverVariable;

    iget-object v5, v10, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aget-object v4, v5, v4

    iget-object v5, v4, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->j:Landroidx/constraintlayout/solver/SolverVariable;

    .line 31
    invoke-virtual {v4}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d()I

    move-result v4

    const/4 v6, 0x6

    .line 32
    invoke-virtual {v1, v0, v5, v4, v6}, Landroidx/constraintlayout/solver/c;->i(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V

    .line 33
    :cond_15
    iget-object v0, v2, Landroidx/constraintlayout/solver/widgets/d;->h:Ljava/util/ArrayList;

    if-eqz v0, :cond_1b

    .line 34
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v4

    const/4 v5, 0x1

    if-le v4, v5, :cond_1b

    .line 35
    iget-boolean v5, v2, Landroidx/constraintlayout/solver/widgets/d;->n:Z

    if-eqz v5, :cond_16

    iget-boolean v5, v2, Landroidx/constraintlayout/solver/widgets/d;->p:Z

    if-nez v5, :cond_16

    .line 36
    iget v5, v2, Landroidx/constraintlayout/solver/widgets/d;->j:I

    int-to-float v5, v5

    move/from16 v28, v5

    goto :goto_11

    :cond_16
    move/from16 v28, v17

    :goto_11
    const/4 v5, 0x0

    move/from16 v27, v5

    move-object/from16 v7, v20

    const/4 v6, 0x0

    :goto_12
    if-ge v6, v4, :cond_1b

    .line 37
    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 38
    iget-object v13, v8, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->p0:[F

    aget v13, v13, p2

    cmpg-float v17, v13, v5

    if-gez v17, :cond_18

    .line 39
    iget-boolean v13, v2, Landroidx/constraintlayout/solver/widgets/d;->p:Z

    if-eqz v13, :cond_17

    .line 40
    iget-object v8, v8, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    add-int/lit8 v13, p3, 0x1

    aget-object v13, v8, v13

    iget-object v13, v13, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->j:Landroidx/constraintlayout/solver/SolverVariable;

    aget-object v8, v8, p3

    iget-object v8, v8, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->j:Landroidx/constraintlayout/solver/SolverVariable;

    move/from16 p0, v5

    const/4 v5, 0x4

    const/4 v14, 0x0

    invoke-virtual {v1, v13, v8, v14, v5}, Landroidx/constraintlayout/solver/c;->e(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)Landroidx/constraintlayout/solver/b;

    move v5, v14

    const/4 v14, 0x6

    goto :goto_15

    :cond_17
    move/from16 p0, v5

    const/4 v5, 0x4

    const/high16 v13, 0x3f800000    # 1.0f

    :goto_13
    move/from16 v29, v13

    goto :goto_14

    :cond_18
    move/from16 p0, v5

    const/4 v5, 0x4

    goto :goto_13

    :goto_14
    cmpl-float v13, v29, p0

    if-nez v13, :cond_19

    .line 41
    iget-object v8, v8, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    add-int/lit8 v13, p3, 0x1

    aget-object v13, v8, v13

    iget-object v13, v13, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->j:Landroidx/constraintlayout/solver/SolverVariable;

    aget-object v8, v8, p3

    iget-object v8, v8, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->j:Landroidx/constraintlayout/solver/SolverVariable;

    const/4 v5, 0x0

    const/4 v14, 0x6

    invoke-virtual {v1, v13, v8, v5, v14}, Landroidx/constraintlayout/solver/c;->e(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)Landroidx/constraintlayout/solver/b;

    goto :goto_15

    :cond_19
    const/4 v5, 0x0

    const/4 v14, 0x6

    if-eqz v7, :cond_1a

    .line 42
    iget-object v7, v7, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aget-object v13, v7, p3

    iget-object v13, v13, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->j:Landroidx/constraintlayout/solver/SolverVariable;

    add-int/lit8 v17, p3, 0x1

    .line 43
    aget-object v7, v7, v17

    iget-object v7, v7, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->j:Landroidx/constraintlayout/solver/SolverVariable;

    .line 44
    iget-object v5, v8, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aget-object v14, v5, p3

    iget-object v14, v14, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->j:Landroidx/constraintlayout/solver/SolverVariable;

    .line 45
    aget-object v5, v5, v17

    iget-object v5, v5, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->j:Landroidx/constraintlayout/solver/SolverVariable;

    .line 46
    invoke-virtual {v1}, Landroidx/constraintlayout/solver/c;->s()Landroidx/constraintlayout/solver/b;

    move-result-object v26

    move-object/from16 v33, v5

    move-object/from16 v31, v7

    move-object/from16 v30, v13

    move-object/from16 v32, v14

    .line 47
    invoke-virtual/range {v26 .. v33}, Landroidx/constraintlayout/solver/b;->k(FFFLandroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;)Landroidx/constraintlayout/solver/b;

    move-object/from16 v5, v26

    .line 48
    invoke-virtual {v1, v5}, Landroidx/constraintlayout/solver/c;->d(Landroidx/constraintlayout/solver/b;)V

    :cond_1a
    move-object v7, v8

    move/from16 v27, v29

    :goto_15
    add-int/lit8 v6, v6, 0x1

    move/from16 v5, p0

    const/4 v14, 0x5

    goto/16 :goto_12

    :cond_1b
    if-eqz v11, :cond_22

    if-eq v11, v12, :cond_1c

    if-eqz v22, :cond_22

    .line 49
    :cond_1c
    iget-object v0, v9, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aget-object v0, v0, p3

    .line 50
    iget-object v2, v10, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    add-int/lit8 v4, p3, 0x1

    aget-object v2, v2, v4

    .line 51
    iget-object v5, v0, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    if-eqz v5, :cond_1d

    iget-object v5, v5, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->j:Landroidx/constraintlayout/solver/SolverVariable;

    goto :goto_16

    :cond_1d
    move-object/from16 v5, v20

    .line 52
    :goto_16
    iget-object v6, v2, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    if-eqz v6, :cond_1e

    iget-object v6, v6, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->j:Landroidx/constraintlayout/solver/SolverVariable;

    goto :goto_17

    :cond_1e
    move-object/from16 v6, v20

    :goto_17
    if-ne v11, v12, :cond_1f

    .line 53
    iget-object v0, v11, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aget-object v2, v0, p3

    .line 54
    aget-object v0, v0, v4

    move-object/from16 v34, v2

    move-object v2, v0

    move-object/from16 v0, v34

    :cond_1f
    if-eqz v5, :cond_21

    if-eqz v6, :cond_21

    if-nez p2, :cond_20

    .line 55
    iget v3, v3, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->Z:F

    :goto_18
    move v4, v3

    goto :goto_19

    .line 56
    :cond_20
    iget v3, v3, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->a0:F

    goto :goto_18

    .line 57
    :goto_19
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d()I

    move-result v3

    .line 58
    invoke-virtual {v2}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d()I

    move-result v7

    .line 59
    iget-object v0, v0, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->j:Landroidx/constraintlayout/solver/SolverVariable;

    iget-object v2, v2, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->j:Landroidx/constraintlayout/solver/SolverVariable;

    const/4 v8, 0x5

    move-object/from16 v34, v1

    move-object v1, v0

    move-object/from16 v0, v34

    move-object/from16 v34, v6

    move-object v6, v2

    move-object v2, v5

    move-object/from16 v5, v34

    invoke-virtual/range {v0 .. v8}, Landroidx/constraintlayout/solver/c;->c(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;IFLandroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V

    :cond_21
    move-object/from16 v0, p1

    goto/16 :goto_2e

    :cond_22
    if-eqz v25, :cond_35

    if-eqz v11, :cond_35

    .line 60
    iget v0, v2, Landroidx/constraintlayout/solver/widgets/d;->j:I

    if-lez v0, :cond_23

    iget v1, v2, Landroidx/constraintlayout/solver/widgets/d;->i:I

    if-ne v1, v0, :cond_23

    const/16 v18, 0x1

    goto :goto_1a

    :cond_23
    const/16 v18, 0x0

    :goto_1a
    move-object v13, v11

    move-object v14, v13

    :goto_1b
    if-eqz v13, :cond_21

    .line 61
    iget-object v0, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->r0:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    aget-object v0, v0, p2

    :goto_1c
    if-eqz v0, :cond_24

    .line 62
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C()I

    move-result v1

    const/16 v5, 0x8

    if-ne v1, v5, :cond_25

    .line 63
    iget-object v0, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->r0:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    aget-object v0, v0, p2

    goto :goto_1c

    :cond_24
    const/16 v5, 0x8

    :cond_25
    if-nez v0, :cond_27

    if-ne v13, v12, :cond_26

    goto :goto_1d

    :cond_26
    move-object/from16 v17, v0

    move-object/from16 p0, v13

    const/16 v19, 0x4

    const/16 v21, 0x6

    move v13, v5

    goto/16 :goto_23

    .line 64
    :cond_27
    :goto_1d
    iget-object v1, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aget-object v1, v1, p3

    .line 65
    iget-object v2, v1, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->j:Landroidx/constraintlayout/solver/SolverVariable;

    .line 66
    iget-object v3, v1, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    if-eqz v3, :cond_28

    iget-object v3, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->j:Landroidx/constraintlayout/solver/SolverVariable;

    goto :goto_1e

    :cond_28
    move-object/from16 v3, v20

    :goto_1e
    if-eq v14, v13, :cond_29

    .line 67
    iget-object v3, v14, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    add-int/lit8 v4, p3, 0x1

    aget-object v3, v3, v4

    iget-object v3, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->j:Landroidx/constraintlayout/solver/SolverVariable;

    goto :goto_1f

    :cond_29
    if-ne v13, v11, :cond_2b

    if-ne v14, v13, :cond_2b

    .line 68
    iget-object v3, v9, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aget-object v3, v3, p3

    iget-object v3, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    if-eqz v3, :cond_2a

    iget-object v3, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->j:Landroidx/constraintlayout/solver/SolverVariable;

    goto :goto_1f

    :cond_2a
    move-object/from16 v3, v20

    .line 69
    :cond_2b
    :goto_1f
    invoke-virtual {v1}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d()I

    move-result v1

    .line 70
    iget-object v4, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    add-int/lit8 v6, p3, 0x1

    aget-object v4, v4, v6

    invoke-virtual {v4}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d()I

    move-result v4

    if-eqz v0, :cond_2c

    .line 71
    iget-object v7, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aget-object v7, v7, p3

    .line 72
    iget-object v8, v7, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->j:Landroidx/constraintlayout/solver/SolverVariable;

    .line 73
    iget-object v5, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aget-object v5, v5, v6

    iget-object v5, v5, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->j:Landroidx/constraintlayout/solver/SolverVariable;

    goto :goto_21

    .line 74
    :cond_2c
    iget-object v5, v10, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aget-object v5, v5, v6

    iget-object v7, v5, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    if-eqz v7, :cond_2d

    .line 75
    iget-object v5, v7, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->j:Landroidx/constraintlayout/solver/SolverVariable;

    move-object v8, v5

    goto :goto_20

    :cond_2d
    move-object/from16 v8, v20

    .line 76
    :goto_20
    iget-object v5, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aget-object v5, v5, v6

    iget-object v5, v5, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->j:Landroidx/constraintlayout/solver/SolverVariable;

    :goto_21
    if-eqz v7, :cond_2e

    .line 77
    invoke-virtual {v7}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d()I

    move-result v7

    add-int/2addr v4, v7

    :cond_2e
    if-eqz v14, :cond_2f

    .line 78
    iget-object v7, v14, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aget-object v7, v7, v6

    invoke-virtual {v7}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d()I

    move-result v7

    add-int/2addr v1, v7

    :cond_2f
    if-eqz v2, :cond_33

    if-eqz v3, :cond_33

    if-eqz v8, :cond_33

    if-eqz v5, :cond_33

    if-ne v13, v11, :cond_30

    .line 79
    iget-object v1, v11, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aget-object v1, v1, p3

    invoke-virtual {v1}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d()I

    move-result v1

    :cond_30
    if-ne v13, v12, :cond_31

    .line 80
    iget-object v4, v12, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aget-object v4, v4, v6

    invoke-virtual {v4}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d()I

    move-result v4

    :cond_31
    move v7, v4

    move-object v6, v5

    move-object v5, v8

    if-eqz v18, :cond_32

    const/4 v8, 0x6

    goto :goto_22

    :cond_32
    const/4 v8, 0x4

    :goto_22
    const/high16 v4, 0x3f000000    # 0.5f

    move-object/from16 p0, v3

    move v3, v1

    move-object v1, v2

    move-object/from16 v2, p0

    move-object/from16 v17, v0

    move-object/from16 p0, v13

    const/16 v13, 0x8

    const/16 v19, 0x4

    const/16 v21, 0x6

    move-object/from16 v0, p1

    .line 81
    invoke-virtual/range {v0 .. v8}, Landroidx/constraintlayout/solver/c;->c(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;IFLandroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V

    goto :goto_23

    :cond_33
    move-object/from16 v17, v0

    move-object/from16 p0, v13

    const/16 v13, 0x8

    const/16 v19, 0x4

    const/16 v21, 0x6

    .line 82
    :goto_23
    invoke-virtual/range {p0 .. p0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C()I

    move-result v0

    if-eq v0, v13, :cond_34

    move-object/from16 v14, p0

    :cond_34
    move-object/from16 v13, v17

    goto/16 :goto_1b

    :cond_35
    const/16 v13, 0x8

    const/16 v19, 0x4

    const/16 v21, 0x6

    if-eqz v15, :cond_21

    if-eqz v11, :cond_21

    .line 83
    iget v0, v2, Landroidx/constraintlayout/solver/widgets/d;->j:I

    if-lez v0, :cond_36

    iget v1, v2, Landroidx/constraintlayout/solver/widgets/d;->i:I

    if-ne v1, v0, :cond_36

    const/16 v18, 0x1

    goto :goto_24

    :cond_36
    const/16 v18, 0x0

    :goto_24
    move-object v0, v11

    move-object v14, v0

    :goto_25
    if-eqz v14, :cond_42

    .line 84
    iget-object v1, v14, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->r0:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    aget-object v1, v1, p2

    :goto_26
    if-eqz v1, :cond_37

    .line 85
    invoke-virtual {v1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C()I

    move-result v2

    if-ne v2, v13, :cond_37

    .line 86
    iget-object v1, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->r0:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    aget-object v1, v1, p2

    goto :goto_26

    :cond_37
    if-eq v14, v11, :cond_40

    if-eq v14, v12, :cond_40

    if-eqz v1, :cond_40

    if-ne v1, v12, :cond_38

    move-object/from16 v1, v20

    .line 87
    :cond_38
    iget-object v2, v14, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aget-object v2, v2, p3

    .line 88
    iget-object v3, v2, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->j:Landroidx/constraintlayout/solver/SolverVariable;

    .line 89
    iget-object v4, v2, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    if-eqz v4, :cond_39

    iget-object v4, v4, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->j:Landroidx/constraintlayout/solver/SolverVariable;

    .line 90
    :cond_39
    iget-object v4, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    add-int/lit8 v5, p3, 0x1

    aget-object v4, v4, v5

    iget-object v4, v4, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->j:Landroidx/constraintlayout/solver/SolverVariable;

    .line 91
    invoke-virtual {v2}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d()I

    move-result v2

    .line 92
    iget-object v6, v14, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aget-object v6, v6, v5

    invoke-virtual {v6}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d()I

    move-result v6

    if-eqz v1, :cond_3b

    .line 93
    iget-object v7, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aget-object v7, v7, p3

    .line 94
    iget-object v8, v7, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->j:Landroidx/constraintlayout/solver/SolverVariable;

    .line 95
    iget-object v13, v7, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    if-eqz v13, :cond_3a

    iget-object v13, v13, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->j:Landroidx/constraintlayout/solver/SolverVariable;

    goto :goto_28

    :cond_3a
    move-object/from16 v13, v20

    goto :goto_28

    .line 96
    :cond_3b
    iget-object v7, v14, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aget-object v7, v7, v5

    iget-object v8, v7, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    if-eqz v8, :cond_3c

    .line 97
    iget-object v13, v8, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->j:Landroidx/constraintlayout/solver/SolverVariable;

    goto :goto_27

    :cond_3c
    move-object/from16 v13, v20

    .line 98
    :goto_27
    iget-object v7, v7, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->j:Landroidx/constraintlayout/solver/SolverVariable;

    move-object/from16 v34, v13

    move-object v13, v7

    move-object v7, v8

    move-object/from16 v8, v34

    :goto_28
    if-eqz v7, :cond_3d

    .line 99
    invoke-virtual {v7}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d()I

    move-result v7

    add-int/2addr v6, v7

    :cond_3d
    move v7, v6

    .line 100
    iget-object v6, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aget-object v5, v6, v5

    invoke-virtual {v5}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d()I

    move-result v5

    add-int/2addr v2, v5

    move-object v5, v8

    if-eqz v18, :cond_3e

    move/from16 v8, v21

    goto :goto_29

    :cond_3e
    move/from16 v8, v19

    :goto_29
    if-eqz v3, :cond_3f

    if-eqz v4, :cond_3f

    if-eqz v5, :cond_3f

    if-eqz v13, :cond_3f

    move-object v6, v1

    move-object v1, v3

    move v3, v2

    move-object v2, v4

    const/high16 v4, 0x3f000000    # 0.5f

    move-object/from16 p0, v0

    move-object/from16 v17, v6

    move-object v6, v13

    const/4 v13, 0x5

    move-object/from16 v0, p1

    .line 101
    invoke-virtual/range {v0 .. v8}, Landroidx/constraintlayout/solver/c;->c(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;IFLandroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V

    goto :goto_2a

    :cond_3f
    move-object/from16 p0, v0

    move-object/from16 v17, v1

    const/4 v13, 0x5

    move-object/from16 v0, p1

    :goto_2a
    move-object/from16 v1, v17

    goto :goto_2b

    :cond_40
    move-object/from16 p0, v0

    const/4 v13, 0x5

    move-object/from16 v0, p1

    .line 102
    :goto_2b
    invoke-virtual {v14}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C()I

    move-result v2

    const/16 v5, 0x8

    if-eq v2, v5, :cond_41

    goto :goto_2c

    :cond_41
    move-object/from16 v14, p0

    :goto_2c
    move v13, v5

    move-object v0, v14

    move-object v14, v1

    goto/16 :goto_25

    :cond_42
    move-object/from16 v0, p1

    const/4 v13, 0x5

    .line 103
    iget-object v1, v11, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aget-object v1, v1, p3

    .line 104
    iget-object v2, v9, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aget-object v2, v2, p3

    iget-object v2, v2, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 105
    iget-object v3, v12, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    add-int/lit8 v4, p3, 0x1

    aget-object v9, v3, v4

    .line 106
    iget-object v3, v10, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aget-object v3, v3, v4

    iget-object v14, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    if-eqz v2, :cond_44

    if-eq v11, v12, :cond_43

    .line 107
    iget-object v3, v1, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->j:Landroidx/constraintlayout/solver/SolverVariable;

    iget-object v2, v2, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->j:Landroidx/constraintlayout/solver/SolverVariable;

    invoke-virtual {v1}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d()I

    move-result v1

    invoke-virtual {v0, v3, v2, v1, v13}, Landroidx/constraintlayout/solver/c;->e(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)Landroidx/constraintlayout/solver/b;

    goto :goto_2d

    :cond_43
    if-eqz v14, :cond_44

    move-object v3, v1

    .line 108
    iget-object v1, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->j:Landroidx/constraintlayout/solver/SolverVariable;

    iget-object v2, v2, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->j:Landroidx/constraintlayout/solver/SolverVariable;

    invoke-virtual {v3}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d()I

    move-result v3

    iget-object v5, v9, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->j:Landroidx/constraintlayout/solver/SolverVariable;

    iget-object v6, v14, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->j:Landroidx/constraintlayout/solver/SolverVariable;

    .line 109
    invoke-virtual {v9}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d()I

    move-result v7

    const/4 v8, 0x5

    const/high16 v4, 0x3f000000    # 0.5f

    .line 110
    invoke-virtual/range {v0 .. v8}, Landroidx/constraintlayout/solver/c;->c(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;IFLandroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V

    :cond_44
    :goto_2d
    if-eqz v14, :cond_45

    if-eq v11, v12, :cond_45

    .line 111
    iget-object v1, v9, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->j:Landroidx/constraintlayout/solver/SolverVariable;

    iget-object v2, v14, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->j:Landroidx/constraintlayout/solver/SolverVariable;

    invoke-virtual {v9}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d()I

    move-result v3

    neg-int v3, v3

    invoke-virtual {v0, v1, v2, v3, v13}, Landroidx/constraintlayout/solver/c;->e(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)Landroidx/constraintlayout/solver/b;

    :cond_45
    :goto_2e
    if-nez v25, :cond_46

    if-eqz v15, :cond_4c

    :cond_46
    if-eqz v11, :cond_4c

    .line 112
    iget-object v1, v11, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aget-object v2, v1, p3

    .line 113
    iget-object v3, v12, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    const/16 v16, 0x1

    add-int/lit8 v4, p3, 0x1

    aget-object v3, v3, v4

    .line 114
    iget-object v5, v2, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    if-eqz v5, :cond_47

    iget-object v5, v5, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->j:Landroidx/constraintlayout/solver/SolverVariable;

    goto :goto_2f

    :cond_47
    move-object/from16 v5, v20

    .line 115
    :goto_2f
    iget-object v6, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    if-eqz v6, :cond_48

    iget-object v6, v6, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->j:Landroidx/constraintlayout/solver/SolverVariable;

    goto :goto_30

    :cond_48
    move-object/from16 v6, v20

    :goto_30
    if-eq v10, v12, :cond_4a

    .line 116
    iget-object v6, v10, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aget-object v6, v6, v4

    .line 117
    iget-object v6, v6, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    if-eqz v6, :cond_49

    iget-object v6, v6, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->j:Landroidx/constraintlayout/solver/SolverVariable;

    move-object/from16 v20, v6

    :cond_49
    move-object/from16 v6, v20

    :cond_4a
    if-ne v11, v12, :cond_4b

    .line 118
    aget-object v3, v1, v4

    :cond_4b
    if-eqz v5, :cond_4c

    if-eqz v6, :cond_4c

    .line 119
    invoke-virtual {v2}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d()I

    move-result v1

    .line 120
    iget-object v7, v12, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aget-object v4, v7, v4

    invoke-virtual {v4}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d()I

    move-result v7

    .line 121
    iget-object v2, v2, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->j:Landroidx/constraintlayout/solver/SolverVariable;

    iget-object v3, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->j:Landroidx/constraintlayout/solver/SolverVariable;

    const/4 v8, 0x5

    const/high16 v4, 0x3f000000    # 0.5f

    move-object/from16 v34, v3

    move v3, v1

    move-object v1, v2

    move-object v2, v5

    move-object v5, v6

    move-object/from16 v6, v34

    invoke-virtual/range {v0 .. v8}, Landroidx/constraintlayout/solver/c;->c(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;IFLandroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V

    :cond_4c
    return-void
.end method
